import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class ProcessConsultationSectionUseCase {
  const ProcessConsultationSectionUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<ConsultationProcessResult> call({
    required ConsultationSection section,
    File? audio,
    String? textInput,
  }) =>
      _repository.processSection(
        section: section,
        audio: audio,
        textInput: textInput,
      );
}
