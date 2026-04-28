import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class SignConsultationUseCase {
  const SignConsultationUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<void> call({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  }) =>
      _repository.signConsultation(
        consultationId: consultationId,
        result: result,
        summary: summary,
        primaryDiagnosis: primaryDiagnosis,
      );
}
