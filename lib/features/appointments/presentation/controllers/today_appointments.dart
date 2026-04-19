import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'today_appointments.g.dart';

@riverpod
List<Appointment> todayAppointments(Ref ref) {
  // TODO(api): reemplazar por fetch real al endpoint de agenda.
  final today = DateTime.now();
  DateTime at(int h, int m) => DateTime(today.year, today.month, today.day, h, m);

  return [
    Appointment(
      id: 'apt-1',
      scheduledAt: at(15, 30),
      patient: const PatientSummary(id: 'p-luna', name: 'Luna Martínez', species: Species.dog),
      reason: 'Control post-quirúrgico · 8 días',
      status: AppointmentStatus.now,
    ),
    Appointment(
      id: 'apt-2',
      scheduledAt: at(16, 0),
      patient: const PatientSummary(id: 'p-mochi', name: 'Mochi Herrera', species: Species.cat),
      reason: 'Vacunación triple felina',
    ),
    Appointment(
      id: 'apt-3',
      scheduledAt: at(16, 30),
      patient: const PatientSummary(id: 'p-thor', name: 'Thor Smith', species: Species.dog),
      reason: 'Gastroenteritis — seguimiento',
      urgent: true,
    ),
    Appointment(
      id: 'apt-4',
      scheduledAt: at(17, 0),
      patient: const PatientSummary(id: 'p-milo', name: 'Milo Ortiz', species: Species.exotic),
      reason: 'Chequeo general',
    ),
    Appointment(
      id: 'apt-5',
      scheduledAt: at(17, 45),
      patient: const PatientSummary(id: 'p-bruno', name: 'Bruno Valdés', species: Species.dog),
      reason: 'Dermatitis recurrente',
    ),
  ];
}
