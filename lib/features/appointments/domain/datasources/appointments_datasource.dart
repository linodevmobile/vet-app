import 'package:vet_app/features/appointments/domain/entities/appointment.dart';

abstract interface class IAppointmentsDatasource {
  Future<List<Appointment>> getToday();
}
