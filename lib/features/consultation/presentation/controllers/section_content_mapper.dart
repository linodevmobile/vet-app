import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_state.dart';

/// Traduce el estado UI (strings en español, inputs raw) al wire format del
/// backend (enums en inglés, números). Una sola fuente de verdad para el shape
/// de `content` por sección, así el controller no arma JSON inline.
abstract final class SectionContentMapper {
  static Map<String, dynamic>? buildContent(
    ConsultationSection section,
    ConsultationFormState s,
  ) {
    switch (section) {
      case ConsultationSection.food:
        return {'regime': _foodRegime[s.food]};
      case ConsultationSection.vitals:
        return {
          'temperature_c': _toDouble(s.temperatureC),
          'heart_rate_bpm': _toDouble(s.heartRateBpm),
          'respiratory_rate_rpm': _toDouble(s.respiratoryRateRpm),
          'weight_kg': _toDouble(s.weightKg),
        };
      case ConsultationSection.exam:
        return {
          'mucosa': _mucosa[s.mucosa],
          'dehydration_percent': s.dehydration,
          'bcs': s.bcs,
          'attitude_owner': _attitude[s.attitudeOwner],
          'attitude_vet': _attitude[s.attitudeVet],
          'pulse': _pulse[s.pulse],
          'tllc_seconds': _toDouble(s.tllcSeconds),
          'trcp_seconds': _toDouble(s.trcpSeconds),
          'systems_affected': s.systemsAffected,
        };
      case ConsultationSection.treatment:
        return {'modality': _treatmentModality[s.treatment]};
      case ConsultationSection.reason:
      case ConsultationSection.anamnesis:
      case ConsultationSection.problems:
      case ConsultationSection.labs:
      case ConsultationSection.diagnosis:
      case ConsultationSection.recipe:
      case ConsultationSection.prognosis:
      case ConsultationSection.identification:
      case ConsultationSection.signature:
        return null;
    }
  }

  // Tolera coma decimal (es-ES) y devuelve null para input vacío o inválido,
  // así un TextField con "abc" no genera 0 (que sería un dato clínico válido).
  static double? _toDouble(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    return double.tryParse(raw.trim().replaceAll(',', '.'));
  }

  static const _foodRegime = {
    'Concentrado': 'concentrate',
    'BARF': 'barf',
    'Casero': 'homemade',
    'Mixto': 'mixed',
    'Otro': 'other',
  };

  static const _mucosa = {
    'Rosadas': 'pink',
    'Pálidas': 'pale',
    'Ictéricas': 'jaundiced',
    'Cianóticas': 'cyanotic',
    'Congestivas': 'congested',
  };

  static const _attitude = {
    'Amigable': 'friendly',
    'Dócil': 'docile',
    'Temeroso': 'fearful',
    'Indiferente': 'indifferent',
    'Agresivo': 'aggressive',
  };

  static const _pulse = {
    'Débil': 'weak',
    'Normal': 'normal',
    'Fuerte': 'strong',
    'Filiforme': 'filiform',
    'Ausente': 'absent',
  };

  static const _treatmentModality = {
    'Ambulatorio': 'ambulatory',
    'Hospitalario': 'hospitalization',
  };
}
