import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';

abstract final class PatientFormatters {
  /// Línea preformateada para sección "Identificación" en consulta.
  /// Ej: "Thor · Golden Retriever · M · 4a · 28.4 kg"
  static String identificationLine(Patient p) {
    final parts = <String>[p.name];
    if (p.breed.isNotEmpty) parts.add(p.breed);
    parts.add(p.sex == Sex.male ? 'M' : 'H');
    parts.add('${p.ageYears}a');
    if (p.weightKg != null) parts.add('${p.weightKg} kg');
    return parts.join(' · ');
  }

  /// Versión degradada para modo resume — `PatientSummary` no trae
  /// breed/age/weight. Solo nombre.
  static String identificationLineFromSummary(PatientSummary p) => p.name;
}
