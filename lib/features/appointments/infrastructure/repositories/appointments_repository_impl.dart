import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/errors/api_exception_handler.dart';
import 'package:vet_app/features/appointments/domain/datasources/appointments_datasource.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/appointments/domain/repositories/appointments_repository.dart';
import 'package:vet_app/features/appointments/infrastructure/datasources/appointments_datasource_impl.dart';

part 'appointments_repository_impl.g.dart';

class AppointmentsRepositoryImpl implements IAppointmentsRepository {
  const AppointmentsRepositoryImpl(this._datasource);

  final IAppointmentsDatasource _datasource;

  @override
  Future<List<Appointment>> getToday() async {
    try {
      return await _datasource.getToday();
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }
}

@riverpod
IAppointmentsRepository appointmentsRepository(Ref ref) =>
    AppointmentsRepositoryImpl(ref.watch(appointmentsDatasourceProvider));
