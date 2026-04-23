import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/consultations/domain/repositories/consultations_repository.dart';

class GetPausedConsultationsUseCase {
  const GetPausedConsultationsUseCase(this._repository);

  final IConsultationsRepository _repository;

  Future<List<PausedConsultation>> call() => _repository.fetchPaused();
}
