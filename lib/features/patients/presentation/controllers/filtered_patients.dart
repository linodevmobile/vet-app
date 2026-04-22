import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/presentation/controllers/all_patients.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_filter_controller.dart';

part 'filtered_patients.g.dart';

// El backend ya aplica filter + search, pero conservamos este provider para
// capas adicionales client-side (hospitalized sigue sin endpoint dedicado).
@riverpod
AsyncValue<List<Patient>> filteredPatients(Ref ref) {
  final async = ref.watch(allPatientsProvider);
  final filter = ref.watch(patientFilterControllerProvider);

  if (filter != PatientFilter.hospitalized) return async;

  return async.whenData(
    (list) => list.where((p) => p.isHospitalized).toList(),
  );
}
