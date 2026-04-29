import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/usecases/get_patient_by_id_usecase.dart';
import 'package:vet_app/features/patients/infrastructure/repositories/patients_repository_impl.dart';

part 'patient_detail_controller.g.dart';

@riverpod
GetPatientByIdUseCase getPatientByIdUseCase(Ref ref) =>
    GetPatientByIdUseCase(ref.watch(patientsRepositoryProvider));

@riverpod
class PatientDetailController extends _$PatientDetailController {
  @override
  Future<Patient> build(String patientId) =>
      ref.read(getPatientByIdUseCaseProvider)(patientId);
}
