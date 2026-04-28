import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class SyncConsultationSectionUseCase {
  const SyncConsultationSectionUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<void> call({
    required String consultationId,
    required ConsultationSection section,
    String? text,
    Map<String, dynamic>? content,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
    File? audio,
  }) =>
      _repository.syncSection(
        consultationId: consultationId,
        section: section,
        text: text,
        content: content,
        transcription: transcription,
        aiSuggested: aiSuggested,
        audio: audio,
      );
}
