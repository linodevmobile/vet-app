import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';

abstract interface class IPatientsRepository {
  Future<List<Patient>> list({
    PatientFilter filter = PatientFilter.all,
    String? search,
    int limit,
    int offset,
  });

  Future<Patient> create(Patient draft);

  Future<Patient> getById(String id);
}
