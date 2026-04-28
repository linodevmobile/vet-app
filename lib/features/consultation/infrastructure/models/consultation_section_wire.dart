import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

/// Mapea `ConsultationSection` (dominio) al string que espera el backend en el
/// path `/consultation/:id/sections/:section` y en el form-data del endpoint
/// `/ai/process-section`. Las secciones UI-only (`identification`, `signature`)
/// no pegan al backend, por eso no figuran en el map y `wireFor` devuelve
/// `null` para ellas — la View usa eso como guard para no intentar sync.
abstract final class ConsultationSectionWire {
  static const Map<ConsultationSection, String> _wire = {
    ConsultationSection.reason: 'chief_complaint',
    ConsultationSection.anamnesis: 'anamnesis',
    ConsultationSection.food: 'food',
    ConsultationSection.vitals: 'vitals',
    ConsultationSection.exam: 'physical_exam',
    ConsultationSection.problems: 'problems',
    ConsultationSection.labs: 'complementary_exams',
    ConsultationSection.diagnosis: 'clinical_diagnosis',
    ConsultationSection.recipe: 'prescription',
    ConsultationSection.treatment: 'treatment',
    ConsultationSection.prognosis: 'prognosis',
  };

  static String? wireFor(ConsultationSection section) => _wire[section];

  static ConsultationSection? sectionForWire(String wire) {
    for (final entry in _wire.entries) {
      if (entry.value == wire) return entry.key;
    }
    return null;
  }
}
