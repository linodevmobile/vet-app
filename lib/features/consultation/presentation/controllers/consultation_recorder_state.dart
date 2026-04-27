import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_recorder_state.freezed.dart';

@freezed
sealed class ConsultationRecorderState with _$ConsultationRecorderState {
  const factory ConsultationRecorderState.idle() = RecorderIdle;

  const factory ConsultationRecorderState.recording({
    required ConsultationSection section,
    required Duration elapsed,
    required double amplitude,
  }) = RecorderRecording;
}
