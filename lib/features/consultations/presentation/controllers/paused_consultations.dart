import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'paused_consultations.g.dart';

@riverpod
List<PausedConsultation> pausedConsultations(Ref ref) {
  // TODO(api): reemplazar por GET /consultations?status=paused (ver consultation-api-gaps §4.3).
  final now = DateTime.now();
  return [
    PausedConsultation(
      id: 'c-thor',
      patient: const PatientSummary(
        id: 'p-thor',
        name: 'Thor Smith',
        species: Species.dog,
      ),
      reason: ConsultationPauseReason.labs,
      note: 'hemograma + química',
      pausedAt: now.subtract(const Duration(hours: 1, minutes: 47)),
      sectionsCompleted: 6,
      sectionsTotal: 10,
    ),
    PausedConsultation(
      id: 'c-michi',
      patient: const PatientSummary(
        id: 'p-michi',
        name: 'Michi Rueda',
        species: Species.cat,
      ),
      reason: ConsultationPauseReason.imaging,
      note: 'radiografía abdominal',
      pausedAt: now.subtract(const Duration(minutes: 42)),
      sectionsCompleted: 7,
      sectionsTotal: 10,
    ),
    PausedConsultation(
      id: 'c-coco-p',
      patient: const PatientSummary(
        id: 'p-coco-p',
        name: 'Coco Pérez',
        species: Species.exotic,
      ),
      reason: ConsultationPauseReason.procedure,
      pausedAt: now.subtract(const Duration(minutes: 18)),
      sectionsCompleted: 4,
      sectionsTotal: 10,
    ),
  ];
}
