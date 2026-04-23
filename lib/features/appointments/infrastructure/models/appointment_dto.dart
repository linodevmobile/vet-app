import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/appointments/infrastructure/models/appointment_patient_dto.dart';

part 'appointment_dto.freezed.dart';
part 'appointment_dto.g.dart';

@freezed
abstract class AppointmentDto with _$AppointmentDto {
  const factory AppointmentDto({
    required String id,
    required String patientId,
    required DateTime scheduledAt,
    required String status,
    String? reason,
    @Default(false) bool urgent,
    String? consultationId,
    AppointmentPatientDto? patient,
  }) = _AppointmentDto;

  factory AppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDtoFromJson(json);
}
