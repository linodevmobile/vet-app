import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section_content.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_status.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';

part 'consultation.freezed.dart';

@freezed
abstract class Consultation with _$Consultation {
  const factory Consultation({
    required String id,
    required PatientSummary patient,
    required ConsultationStatus status,
    required DateTime createdAt,
    required List<ConsultationSectionContent> sections,
    String? chiefComplaint,
    String? summary,
    String? primaryDiagnosis,
    ConsultationResult? result,
    ConsultationPauseReason? pauseReason,
    String? pauseNote,
    DateTime? pausedAt,
    DateTime? signedAt,
  }) = _Consultation;
}
