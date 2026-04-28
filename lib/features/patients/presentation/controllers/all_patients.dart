import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/usecases/list_patients_usecase.dart';
import 'package:vet_app/features/patients/infrastructure/repositories/patients_repository_impl.dart';
import 'package:vet_app/features/patients/presentation/controllers/debounced_patient_search_query.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_filter_controller.dart';

part 'all_patients.g.dart';

@riverpod
ListPatientsUseCase listPatientsUseCase(Ref ref) =>
    ListPatientsUseCase(ref.watch(patientsRepositoryProvider));

@riverpod
class AllPatients extends _$AllPatients {
  @override
  Future<List<Patient>> build() async {
    final filter = ref.watch(patientFilterControllerProvider);
    final query = ref.watch(debouncedPatientSearchQueryProvider).trim();
    return ref.read(listPatientsUseCaseProvider)(
      filter: filter,
      search: query.isEmpty ? null : query,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final filter = ref.read(patientFilterControllerProvider);
      final query = ref.read(debouncedPatientSearchQueryProvider).trim();
      return ref.read(listPatientsUseCaseProvider)(
        filter: filter,
        search: query.isEmpty ? null : query,
      );
    });
  }
}
