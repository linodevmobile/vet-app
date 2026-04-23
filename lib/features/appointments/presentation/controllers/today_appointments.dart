import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/appointments/domain/entities/appointment.dart';
import 'package:vet_app/features/appointments/domain/usecases/get_today_appointments_usecase.dart';
import 'package:vet_app/features/appointments/infrastructure/repositories/appointments_repository_impl.dart';

part 'today_appointments.g.dart';

@riverpod
GetTodayAppointmentsUseCase getTodayAppointmentsUseCase(Ref ref) =>
    GetTodayAppointmentsUseCase(ref.watch(appointmentsRepositoryProvider));

@riverpod
class TodayAppointments extends _$TodayAppointments {
  @override
  Future<List<Appointment>> build() =>
      ref.read(getTodayAppointmentsUseCaseProvider)();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getTodayAppointmentsUseCaseProvider)(),
    );
  }
}
