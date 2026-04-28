import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_patient_dto.freezed.dart';
part 'consultation_patient_dto.g.dart';

@freezed
abstract class ConsultationPatientDto with _$ConsultationPatientDto {
  const factory ConsultationPatientDto({
    required String id,
    required String name,
    required String species,
  }) = _ConsultationPatientDto;

  factory ConsultationPatientDto.fromJson(Map<String, dynamic> json) =>
      _$ConsultationPatientDtoFromJson(json);
}
