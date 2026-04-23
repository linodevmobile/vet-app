import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';

abstract interface class IConsultationRepository {
  Future<ConsultationProcessResult> processAudio({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  });

  Future<void> pauseConsultation({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  });

  Future<void> signConsultation({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  });
}
