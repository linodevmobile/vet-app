import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_patient_dto.freezed.dart';
part 'appointment_patient_dto.g.dart';

@freezed
abstract class AppointmentPatientDto with _$AppointmentPatientDto {
  const factory AppointmentPatientDto({
    required String id,
    required String name,
    required String species,
  }) = _AppointmentPatientDto;

  factory AppointmentPatientDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPatientDtoFromJson(json);
}
