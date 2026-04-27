import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/audio/audio_recording_service.dart';
import 'package:vet_app/core/audio/microphone_permission_service.dart';
import 'package:vet_app/core/errors/failures.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_delivery.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_state.dart';

part 'consultation_recorder_controller.g.dart';

@riverpod
class ConsultationRecorderController extends _$ConsultationRecorderController {
  static const Duration _maxDuration = Duration(minutes: 5);
  static const Duration _minDuration = Duration(seconds: 1);

  StreamSubscription<Duration>? _elapsedSub;
  StreamSubscription<double>? _amplitudeSub;
  double _lastAmplitude = 0;
  ConsultationSection? _activeSection;
  bool _autoStopTriggered = false;

  @override
  FutureOr<ConsultationRecorderState> build() {
    ref.onDispose(_cancelStreams);
    return const ConsultationRecorderState.idle();
  }

  Future<void> toggle({required ConsultationSection section}) async {
    final current = state.value;
    if (current is RecorderIdle) {
      await _start(section: section);
    } else if (current is RecorderRecording) {
      await _stopAndDeliver();
    }
  }

  /// Cierre programático (ej. app a background). No-op fuera de recording.
  Future<void> stop() async {
    if (state.value is! RecorderRecording) return;
    await _stopAndDeliver();
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

  Future<void> _start({required ConsultationSection section}) async {
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
    _autoStopTriggered = false;
    _lastAmplitude = 0;

    state = AsyncData(
      ConsultationRecorderState.recording(
        section: section,
        elapsed: Duration.zero,
        amplitude: 0,
      ),
    );

    _amplitudeSub = service.amplitude.listen((amp) => _lastAmplitude = amp);
    _elapsedSub = service.elapsed.listen(_onElapsed);
  }

  void _onElapsed(Duration elapsed) {
    if (!ref.mounted) return;
    final section = _activeSection;
    if (state.value is! RecorderRecording || section == null) return;
    state = AsyncData(
      ConsultationRecorderState.recording(
        section: section,
        elapsed: elapsed,
        amplitude: _lastAmplitude,
      ),
    );
    if (elapsed >= _maxDuration && !_autoStopTriggered) {
      _autoStopTriggered = true;
      unawaited(_stopAndDeliver());
    }
  }

  Future<void> _stopAndDeliver() async {
    final section = _activeSection;
    if (section == null) {
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

    // Tap accidental: si no duró el mínimo, descartar sin emitir.
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

    ref
        .read(consultationRecorderDeliveryProvider.notifier)
        .emit(section: section, audio: file);

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
    _autoStopTriggered = false;
    _lastAmplitude = 0;
  }
}
