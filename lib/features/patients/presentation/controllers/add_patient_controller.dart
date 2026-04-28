import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/usecases/create_patient_usecase.dart';
import 'package:vet_app/features/patients/infrastructure/repositories/patients_repository_impl.dart';
import 'package:vet_app/features/patients/presentation/controllers/all_patients.dart';

part 'add_patient_controller.g.dart';

@riverpod
CreatePatientUseCase createPatientUseCase(Ref ref) =>
    CreatePatientUseCase(ref.watch(patientsRepositoryProvider));

@riverpod
class AddPatientController extends _$AddPatientController {
  @override
  AsyncValue<Patient?> build() => const AsyncData(null);

  Future<void> submit(Patient draft) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(createPatientUseCaseProvider)(draft),
    );
    if (!ref.mounted) return;
    if (!state.hasError) {
      ref.invalidate(allPatientsProvider);
    }
  }
}
