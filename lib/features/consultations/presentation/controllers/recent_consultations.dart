import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_type.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'recent_consultations.g.dart';

@riverpod
List<ConsultationRecord> recentConsultations(Ref ref) {
  // TODO(api): reemplazar por fetch real al endpoint de consultas.
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));
  final twoDaysAgo = now.subtract(const Duration(days: 2));

  return [
    ConsultationRecord(
      id: 'c-max',
      patient: const PatientSummary(id: 'p-max', name: 'Max', species: Species.dog),
      summary: 'Chequeo de rutina · vacuna al día',
      performedAt: DateTime(yesterday.year, yesterday.month, yesterday.day, 17, 20),
      type: ConsultationType.routine,
    ),
    ConsultationRecord(
      id: 'c-bella',
      patient: const PatientSummary(id: 'p-bella', name: 'Bella', species: Species.cat),
      summary: 'Control post-esterilización',
      performedAt: DateTime(yesterday.year, yesterday.month, yesterday.day, 14, 5),
      type: ConsultationType.surgery,
    ),
    ConsultationRecord(
      id: 'c-coco',
      patient: const PatientSummary(id: 'p-coco', name: 'Coco', species: Species.exotic),
      summary: 'Sospecha de psitacosis — cultivo',
      performedAt: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 10, 0),
      type: ConsultationType.emergency,
    ),
    ConsultationRecord(
      id: 'c-rocky',
      patient: const PatientSummary(id: 'p-rocky', name: 'Rocky', species: Species.dog),
      summary: 'Desparasitación + antipulgas',
      performedAt: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 9, 30),
      type: ConsultationType.routine,
    ),
  ];
}
