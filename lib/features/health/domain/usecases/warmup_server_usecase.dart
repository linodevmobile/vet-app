import 'package:vet_app/features/health/domain/repositories/health_repository.dart';

class WarmupServerUseCase {
  const WarmupServerUseCase(this._repository);

  final IHealthRepository _repository;

  Future<void> call() => _repository.warmup();
}
