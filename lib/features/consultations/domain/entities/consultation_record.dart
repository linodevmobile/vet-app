import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_type.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';

part 'consultation_record.freezed.dart';

@freezed
abstract class ConsultationRecord with _$ConsultationRecord {
  const factory ConsultationRecord({
    required String id,
    required PatientSummary patient,
    required String summary,
    required DateTime performedAt,
    required ConsultationType type,
  }) = _ConsultationRecord;
}
