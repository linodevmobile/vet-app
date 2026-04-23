import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';

part 'appointment.freezed.dart';

enum AppointmentStatus { scheduled, now, completed, cancelled }

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required DateTime scheduledAt,
    required PatientSummary patient,
    required String reason,
    @Default(false) bool urgent,
    @Default(AppointmentStatus.scheduled) AppointmentStatus status,
    String? consultationId,
  }) = _Appointment;
}
