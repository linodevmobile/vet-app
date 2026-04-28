import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';

part 'paused_consultation.freezed.dart';

@freezed
abstract class PausedConsultation with _$PausedConsultation {
  const factory PausedConsultation({
    required String id,
    required PatientSummary patient,
    required ConsultationPauseReason reason,
    required DateTime pausedAt,
    required int sectionsCompleted,
    required int sectionsTotal,
    String? note,
  }) = _PausedConsultation;
}
