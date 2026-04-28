import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/errors/api_exception_handler.dart';
import 'package:vet_app/features/patients/domain/datasources/patients_datasource.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/domain/repositories/patients_repository.dart';
import 'package:vet_app/features/patients/infrastructure/datasources/patients_datasource_impl.dart';

part 'patients_repository_impl.g.dart';

class PatientsRepositoryImpl implements IPatientsRepository {
  const PatientsRepositoryImpl(this._datasource);

  final IPatientsDatasource _datasource;

  @override
  Future<List<Patient>> list({
    PatientFilter filter = PatientFilter.all,
    String? search,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      return await _datasource.list(
        filter: filter,
        search: search,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }

  @override
  Future<Patient> create(Patient draft) async {
    try {
      return await _datasource.create(draft);
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }
}

@riverpod
IPatientsRepository patientsRepository(Ref ref) =>
    PatientsRepositoryImpl(ref.watch(patientsDatasourceProvider));
