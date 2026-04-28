import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/domain/repositories/patients_repository.dart';

class ListPatientsUseCase {
  const ListPatientsUseCase(this._repository);

  final IPatientsRepository _repository;

  Future<List<Patient>> call({
    PatientFilter filter = PatientFilter.all,
    String? search,
    int limit = 50,
    int offset = 0,
  }) =>
      _repository.list(
        filter: filter,
        search: search,
        limit: limit,
        offset: offset,
      );
}
