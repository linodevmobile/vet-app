import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class PauseConsultationUseCase {
  const PauseConsultationUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<void> call({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  }) =>
      _repository.pauseConsultation(
        consultationId: consultationId,
        reason: reason,
        note: note,
      );
}
