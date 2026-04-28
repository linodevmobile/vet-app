import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class ResumeConsultationUseCase {
  const ResumeConsultationUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<void> call(String consultationId) =>
      _repository.resumeConsultation(consultationId);
}
