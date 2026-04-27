import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

/// Mapea `ConsultationSection` (dominio) al string que espera el backend en el
/// path `/consultation/:id/sections/:section` y en el form-data del endpoint
/// `/ai/process-section`. Las secciones UI-only (`identification`, `food`,
/// `vitals`, `treatment`, `signature`) no pegan al backend, por eso no
/// figuran en el map y `wireFor` devuelve `null` para ellas.
abstract final class ConsultationSectionWire {
  static const Map<ConsultationSection, String> _wire = {
    ConsultationSection.reason: 'chief_complaint',
    ConsultationSection.anamnesis: 'anamnesis',
    ConsultationSection.exam: 'physical_exam',
    ConsultationSection.problems: 'problems',
    ConsultationSection.labs: 'complementary_exams',
    ConsultationSection.diagnosis: 'diagnostico_clinico',
    ConsultationSection.recipe: 'prescription',
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
