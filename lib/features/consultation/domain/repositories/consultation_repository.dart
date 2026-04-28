import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

abstract interface class IConsultationRepository {
  Future<String> createConsultation({
    required String patientId,
    String? type,
  });

  Future<ConsultationProcessResult> processSection({
    required ConsultationSection section,
    File? audio,
    String? textInput,
  });

  Future<void> syncSection({
    required String consultationId,
    required ConsultationSection section,
    String? text,
    Map<String, dynamic>? content,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
    File? audio,
  });

  Future<Consultation> getById(String consultationId);

  Future<void> pauseConsultation({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  });

  Future<void> resumeConsultation(String consultationId);

  Future<void> signConsultation({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  });
}
