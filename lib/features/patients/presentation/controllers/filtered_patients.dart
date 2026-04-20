import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/presentation/controllers/all_patients.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_filter_controller.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_search_query.dart';

part 'filtered_patients.g.dart';

@riverpod
List<Patient> filteredPatients(Ref ref) {
  final all = ref.watch(allPatientsProvider);
  final filter = ref.watch(patientFilterControllerProvider);
  final query = ref.watch(patientSearchQueryProvider).trim().toLowerCase();

  final byFilter = switch (filter) {
    PatientFilter.all => all,
    PatientFilter.hospitalized => all.where((p) => p.isHospitalized).toList(),
    // TODO(filters): wire con providers reales cuando exista backend compartido.
    PatientFilter.todayAgenda => all,
    PatientFilter.favorites => all,
    PatientFilter.recent => all,
  };

  if (query.isEmpty) return byFilter;

  return byFilter.where((p) {
    return p.name.toLowerCase().contains(query) ||
        p.ownerName.toLowerCase().contains(query) ||
        p.breed.toLowerCase().contains(query);
  }).toList();
}
