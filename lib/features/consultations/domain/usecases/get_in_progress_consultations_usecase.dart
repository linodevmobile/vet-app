import 'package:vet_app/features/consultation/domain/entities/in_progress_consultation.dart';
import 'package:vet_app/features/consultations/domain/repositories/consultations_repository.dart';

class GetInProgressConsultationsUseCase {
  const GetInProgressConsultationsUseCase(this._repository);

  final IConsultationsRepository _repository;

  Future<List<InProgressConsultation>> call() => _repository.fetchInProgress();
}
