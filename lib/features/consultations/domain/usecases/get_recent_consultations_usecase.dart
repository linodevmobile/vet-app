import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/repositories/consultations_repository.dart';

class GetRecentConsultationsUseCase {
  const GetRecentConsultationsUseCase(this._repository);

  final IConsultationsRepository _repository;

  Future<List<ConsultationRecord>> call({int limit = 4}) =>
      _repository.fetchRecent(limit: limit);
}
