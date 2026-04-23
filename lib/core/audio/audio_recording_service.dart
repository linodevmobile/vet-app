import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_recording_service.g.dart';

class AudioRecordingService {
  AudioRecordingService();

  static const RecordConfig _config = RecordConfig(
    encoder: AudioEncoder.aacLc,
    bitRate: 128000,
    sampleRate: 44100,
  );

  static const Duration _tickInterval = Duration(milliseconds: 100);

  final AudioRecorder _recorder = AudioRecorder();

  final StreamController<Duration> _elapsedCtrl =
      StreamController<Duration>.broadcast();
  final StreamController<double> _amplitudeCtrl =
      StreamController<double>.broadcast();

  Stopwatch? _stopwatch;
  Timer? _elapsedTimer;
  StreamSubscription<Amplitude>? _amplitudeSub;
  String? _currentPath;

  Stream<Duration> get elapsed => _elapsedCtrl.stream;
  Stream<double> get amplitude => _amplitudeCtrl.stream;

  Future<void> start() async {
    final tempDir = await getTemporaryDirectory();
    final path =
        '${tempDir.path}/consultation_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(_config, path: path);
    _currentPath = path;

    final stopwatch = Stopwatch()..start();
    _stopwatch = stopwatch;
    _elapsedTimer = Timer.periodic(_tickInterval, (_) {
      if (_elapsedCtrl.isClosed) return;
      _elapsedCtrl.add(stopwatch.elapsed);
    });

    // dBFS normalizado a [0..1] — silencio absoluto ~-60 dB, pico 0 dB.
    _amplitudeSub =
        _recorder.onAmplitudeChanged(_tickInterval).listen((amp) {
      if (_amplitudeCtrl.isClosed) return;
      final normalized = ((amp.current + 60) / 60).clamp(0.0, 1.0);
      _amplitudeCtrl.add(normalized);
    });
  }

  Future<File> stop() async {
    final path = await _recorder.stop();
    await _cancelStreams();
    if (path == null) {
      throw StateError('Recorder stopped sin path.');
    }
    _currentPath = null;
    return File(path);
  }

  Future<void> discard() async {
    await _recorder.cancel();
    await _cancelStreams();
    final path = _currentPath;
    _currentPath = null;
    if (path != null) {
      final file = File(path);
      if (file.existsSync()) await file.delete();
    }
  }

  Future<void> _cancelStreams() async {
    _elapsedTimer?.cancel();
    _elapsedTimer = null;
    _stopwatch?.stop();
    _stopwatch = null;
    await _amplitudeSub?.cancel();
    _amplitudeSub = null;
  }

  Future<void> dispose() async {
    await _cancelStreams();
    await _recorder.dispose();
    await _elapsedCtrl.close();
    await _amplitudeCtrl.close();
  }
}

// `keepAlive` evita que el service se autodisponga entre reads: mantiene timer,
// streams y recorder vivos durante toda la sesión de consulta aunque el
// controller lo tome con `ref.read` (sin watch).
@Riverpod(keepAlive: true)
AudioRecordingService audioRecordingService(Ref ref) {
  final service = AudioRecordingService();
  ref.onDispose(service.dispose);
  return service;
}
