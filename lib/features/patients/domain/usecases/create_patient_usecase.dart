import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/repositories/patients_repository.dart';

class CreatePatientUseCase {
  const CreatePatientUseCase(this._repository);

  final IPatientsRepository _repository;

  Future<Patient> call(Patient draft) => _repository.create(draft);
}
