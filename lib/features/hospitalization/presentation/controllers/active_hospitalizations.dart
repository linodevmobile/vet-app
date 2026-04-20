import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/hospitalization/domain/entities/hospitalized_patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'active_hospitalizations.g.dart';

@riverpod
List<HospitalizedPatient> activeHospitalizations(Ref ref) {
  // TODO(api): reemplazar por fetch real al endpoint de hospitalización.
  return const [
    HospitalizedPatient(
      id: 'h-kira',
      patient: PatientSummary(id: 'p-kira', name: 'Kira', species: Species.dog),
      day: 2,
      note: 'Pancreatitis aguda · IV ringer 50ml/h',
      tasks: [true, true, true, false, false, false],
      critical: true,
    ),
    HospitalizedPatient(
      id: 'h-simon',
      patient: PatientSummary(id: 'p-simon', name: 'Simón', species: Species.cat),
      day: 4,
      note: 'Post-op castración · evoluciona bien',
      tasks: [true, true, true, true, true, false],
    ),
  ];
}
