import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';

typedef PatientDetailVital = ({String label, String value, String unit});

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

  /// Línea bajo el nombre en patient detail. Ej: "Labrador · ♂ · 7 años".
  static String detailIdentityLine(Patient p) {
    final parts = <String>[
      if (p.breed.isNotEmpty) p.breed,
      p.sex == Sex.male ? '♂' : '♀',
      '${p.ageYears} años',
    ];
    return parts.join(' · ');
  }

  /// Línea de owner. Ej: "Julian Smith · +34 612 345 678".
  /// Si no hay teléfono, solo nombre.
  static String detailOwnerLine(Patient p) {
    final phone = p.ownerPhone;
    if (phone == null || phone.isEmpty) return p.ownerName;
    return '${p.ownerName} · $phone';
  }

  /// Strip de vitals para patient detail. Hoy backend solo expone Peso y Edad;
  /// Últ. visita y próxima cita quedan con `—` hasta tener endpoints.
  static List<PatientDetailVital> detailVitals(Patient p) {
    final w = p.weightKg;
    return [
      (
        label: 'Peso',
        value: w != null ? w.toStringAsFixed(1) : '—',
        unit: w != null ? 'kg' : '',
      ),
      (label: 'Edad', value: '${p.ageYears}', unit: 'años'),
      (label: 'Últ.', value: '—', unit: ''),
      (label: 'Próx.', value: '—', unit: ''),
    ];
  }
}
