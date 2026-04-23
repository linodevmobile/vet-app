import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/audio/audio_recording_service.dart';
import 'package:vet_app/core/audio/microphone_permission_service.dart';
import 'package:vet_app/core/errors/failures.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/usecases/process_consultation_audio_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_request.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';
import 'package:vet_app/features/consultation/presentation/controllers/active_consultation.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_result.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_state.dart';

part 'consultation_recorder_controller.g.dart';

@riverpod
ProcessConsultationAudioUseCase processConsultationAudioUseCase(Ref ref) =>
    ProcessConsultationAudioUseCase(ref.watch(consultationRepositoryProvider));

@riverpod
class ConsultationRecorderController extends _$ConsultationRecorderController {
  static const Duration _maxDuration = Duration(minutes: 5);
  static const Duration _minDuration = Duration(seconds: 1);

  StreamSubscription<Duration>? _elapsedSub;
  StreamSubscription<double>? _amplitudeSub;
  double _lastAmplitude = 0;
  ConsultationSection? _activeSection;
  String? _patientId;
  String? _consultationId;
  bool _autoStopTriggered = false;

  @override
  FutureOr<ConsultationRecorderState> build() {
    ref.onDispose(_cancelStreams);
    return const ConsultationRecorderState.idle();
  }

  Future<void> toggle({
    required ConsultationSection section,
    required String patientId,
    String? consultationId,
  }) async {
    final current = state.value;
    if (current is RecorderIdle) {
      await _start(
        section: section,
        patientId: patientId,
        consultationId: consultationId,
      );
    } else if (current is RecorderRecording) {
      await _stopAndUpload();
    }
    // RecorderUploading: botón deshabilitado, no debería llegar tap.
  }

  /// Cierre programático (ej. app a background). No-op fuera de recording.
  Future<void> stop() async {
    if (state.value is! RecorderRecording) return;
    await _stopAndUpload();
  }

  Future<void> discard() async {
    if (state.value is! RecorderRecording) return;
    await _cancelStreams();
    final service = ref.read(audioRecordingServiceProvider);
    final guarded = await AsyncValue.guard(service.discard);
    if (!ref.mounted) return;
    if (guarded.hasError) {
      state = AsyncError(
        AudioRecordingFailure(cause: guarded.error),
        guarded.stackTrace ?? StackTrace.current,
      );
    }
    state = const AsyncData(ConsultationRecorderState.idle());
    _resetContext();
  }

  Future<void> _start({
    required ConsultationSection section,
    required String patientId,
    String? consultationId,
  }) async {
    if (ConsultationProcessRequest.wireFor(section) == null) {
      // Sección que no va al backend (identification / signature) — ignorar.
      return;
    }

    final permission =
        await ref.read(microphonePermissionServiceProvider).request();
    if (!ref.mounted) return;
    if (permission != MicPermissionResult.granted) {
      state = AsyncError(
        MicPermissionFailure(
          permanent: permission == MicPermissionResult.permanentlyDenied,
        ),
        StackTrace.current,
      );
      state = const AsyncData(ConsultationRecorderState.idle());
      return;
    }

    final service = ref.read(audioRecordingServiceProvider);
    final started = await AsyncValue.guard(service.start);
    if (!ref.mounted) return;
    if (started.hasError) {
      state = AsyncError(
        AudioRecordingFailure(cause: started.error),
        started.stackTrace ?? StackTrace.current,
      );
      state = const AsyncData(ConsultationRecorderState.idle());
      return;
    }

    _activeSection = section;
    _patientId = patientId;
    _consultationId = consultationId;
    _autoStopTriggered = false;
    _lastAmplitude = 0;

    state = const AsyncData(
      ConsultationRecorderState.recording(
        elapsed: Duration.zero,
        amplitude: 0,
      ),
    );

    _amplitudeSub = service.amplitude.listen((amp) => _lastAmplitude = amp);
    _elapsedSub = service.elapsed.listen(_onElapsed);
  }

  void _onElapsed(Duration elapsed) {
    if (!ref.mounted) return;
    if (state.value is! RecorderRecording) return;
    state = AsyncData(
      ConsultationRecorderState.recording(
        elapsed: elapsed,
        amplitude: _lastAmplitude,
      ),
    );
    if (elapsed >= _maxDuration && !_autoStopTriggered) {
      _autoStopTriggered = true;
      unawaited(_stopAndUpload());
    }
  }

  Future<void> _stopAndUpload() async {
    final section = _activeSection;
    final patientId = _patientId;
    if (section == null || patientId == null) {
      state = const AsyncData(ConsultationRecorderState.idle());
      _resetContext();
      return;
    }

    final elapsed = switch (state.value) {
      RecorderRecording(:final elapsed) => elapsed,
      _ => Duration.zero,
    };

    await _cancelStreams();

    final service = ref.read(audioRecordingServiceProvider);

    // Tap accidental: si no duró el mínimo, descartar sin pegarle al backend.
    if (elapsed < _minDuration) {
      final guarded = await AsyncValue.guard(service.discard);
      if (!ref.mounted) return;
      if (guarded.hasError) {
        state = AsyncError(
          AudioRecordingFailure(cause: guarded.error),
          guarded.stackTrace ?? StackTrace.current,
        );
      }
      state = const AsyncData(ConsultationRecorderState.idle());
      _resetContext();
      return;
    }

    final stopped = await AsyncValue.guard(service.stop);
    if (!ref.mounted) return;
    if (stopped.hasError) {
      state = AsyncError(
        AudioRecordingFailure(cause: stopped.error),
        stopped.stackTrace ?? StackTrace.current,
      );
      state = const AsyncData(ConsultationRecorderState.idle());
      _resetContext();
      return;
    }

    final file = stopped.requireValue;

    state = AsyncData(ConsultationRecorderState.uploading(section: section));

    final wire = ConsultationProcessRequest.wireFor(section)!;
    final consultationId = _consultationId;
    final upload = await AsyncValue.guard(
      () => ref.read(processConsultationAudioUseCaseProvider)(
        audio: file,
        section: wire,
        patientId: patientId,
        consultationId: consultationId,
      ),
    );
    if (!ref.mounted) {
      await _safeDelete(file);
      return;
    }
    if (upload.hasError) {
      await _safeDelete(file);
      if (!ref.mounted) return;
      state = AsyncError(
        upload.error!,
        upload.stackTrace ?? StackTrace.current,
      );
      state = const AsyncData(ConsultationRecorderState.idle());
      _resetContext();
      return;
    }

    final result = upload.requireValue;
    ref.read(activeConsultationProvider.notifier).setId(result.consultationId);
    ref
        .read(consultationRecorderResultProvider.notifier)
        .emit(section: section, result: result);
    await _safeDelete(file);

    state = const AsyncData(ConsultationRecorderState.idle());
    _resetContext();
  }

  Future<void> _cancelStreams() async {
    await _elapsedSub?.cancel();
    _elapsedSub = null;
    await _amplitudeSub?.cancel();
    _amplitudeSub = null;
  }

  void _resetContext() {
    _activeSection = null;
    _patientId = null;
    _consultationId = null;
    _autoStopTriggered = false;
    _lastAmplitude = 0;
  }

  Future<void> _safeDelete(File file) async {
    if (!file.existsSync()) return;
    await AsyncValue.guard(file.delete);
  }
}
