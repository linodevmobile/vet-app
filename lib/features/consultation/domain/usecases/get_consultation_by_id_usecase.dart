import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';

class GetConsultationByIdUseCase {
  const GetConsultationByIdUseCase(this._repository);

  final IConsultationRepository _repository;

  Future<Consultation> call(String consultationId) =>
      _repository.getById(consultationId);
}
