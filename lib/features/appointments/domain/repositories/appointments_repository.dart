import 'package:vet_app/features/appointments/domain/entities/appointment.dart';

abstract interface class IAppointmentsRepository {
  Future<List<Appointment>> getToday();
}
