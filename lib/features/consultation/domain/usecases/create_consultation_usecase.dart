import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class CreateConsultationUseCase {
  const CreateConsultationUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<String> call({
    required String patientId,
    String? type,
  }) =>
      _repository.createConsultation(patientId: patientId, type: type);
}
