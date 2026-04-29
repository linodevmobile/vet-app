import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/repositories/patients_repository.dart';

class GetPatientByIdUseCase {
  const GetPatientByIdUseCase(this._repository);

  final IPatientsRepository _repository;

  Future<Patient> call(String id) => _repository.getById(id);
}
