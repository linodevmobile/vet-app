import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_patient_dto.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_section_dto.dart';

part 'consultation_dto.freezed.dart';
part 'consultation_dto.g.dart';

@freezed
abstract class ConsultationDto with _$ConsultationDto {
  const factory ConsultationDto({
    required String id,
    required String status,
    required DateTime createdAt,
    required ConsultationPatientDto patient,
    String? type,
    String? chiefComplaint,
    String? result,
    String? summary,
    String? primaryDiagnosis,
    String? pausedReason,
    String? pausedNote,
    DateTime? pausedAt,
    DateTime? signedAt,
    @Default(<ConsultationSectionDto>[]) List<ConsultationSectionDto> sections,
  }) = _ConsultationDto;

  factory ConsultationDto.fromJson(Map<String, dynamic> json) =>
      _$ConsultationDtoFromJson(json);
}
