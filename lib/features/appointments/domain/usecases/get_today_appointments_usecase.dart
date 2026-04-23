import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/appointments/domain/repositories/appointments_repository.dart';

class GetTodayAppointmentsUseCase {
  const GetTodayAppointmentsUseCase(this._repository);

  final IAppointmentsRepository _repository;

  Future<List<Appointment>> call() => _repository.getToday();
}
