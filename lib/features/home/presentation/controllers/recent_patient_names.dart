import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_patient_names.g.dart';

@riverpod
List<String> recentPatientNames(Ref ref) {
  // TODO(patients): reemplazar por provider real del feature Pacientes.
  return const ['Luna', 'Thor', 'Max'];
}
