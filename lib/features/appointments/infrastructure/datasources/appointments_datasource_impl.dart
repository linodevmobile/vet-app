import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/appointments/domain/datasources/appointments_datasource.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/appointments/infrastructure/api/appointments_api.dart';
import 'package:vet_app/features/appointments/infrastructure/models/appointment_dto.dart';
import 'package:vet_app/features/appointments/infrastructure/models/appointment_patient_dto.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'appointments_datasource_impl.g.dart';

class AppointmentsDatasourceImpl implements IAppointmentsDatasource {
  const AppointmentsDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<List<Appointment>> getToday() async {
    final raw = await _api.get(AppointmentsApi.today);
    final data = ApiEnvelope.unwrapList(raw);
    return data
        .map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
        .map(_toEntity)
        .toList();
  }

  static Appointment _toEntity(AppointmentDto dto) => Appointment(
        id: dto.id,
        scheduledAt: dto.scheduledAt,
        patient: _summary(dto.patient, dto.patientId),
        reason: dto.reason ?? '',
        urgent: dto.urgent,
        status: _parseStatus(dto.status),
        consultationId: dto.consultationId,
      );

  static PatientSummary _summary(AppointmentPatientDto? p, String fallbackId) {
    if (p == null) {
      return PatientSummary(id: fallbackId, name: '—', species: Species.exotic);
    }
    return PatientSummary(
      id: p.id,
      name: p.name,
      species: _parseSpecies(p.species),
    );
  }

  static AppointmentStatus _parseStatus(String raw) =>
      AppointmentStatus.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => AppointmentStatus.scheduled,
      );

  static Species _parseSpecies(String raw) => Species.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => Species.exotic,
      );
}

@riverpod
IAppointmentsDatasource appointmentsDatasource(Ref ref) =>
    AppointmentsDatasourceImpl(ref.watch(apiServiceProvider));
