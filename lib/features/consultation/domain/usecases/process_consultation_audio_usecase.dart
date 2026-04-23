import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class ProcessConsultationAudioUseCase {
  const ProcessConsultationAudioUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<ConsultationProcessResult> call({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  }) =>
      _repository.processAudio(
        audio: audio,
        section: section,
        patientId: patientId,
        consultationId: consultationId,
        consultationType: consultationType,
        chiefComplaint: chiefComplaint,
      );
}
