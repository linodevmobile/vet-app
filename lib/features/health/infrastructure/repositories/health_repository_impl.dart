import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/health/domain/datasources/health_datasource.dart';
import 'package:vet_app/features/health/domain/repositories/health_repository.dart';
import 'package:vet_app/features/health/infrastructure/datasources/health_datasource_impl.dart';

part 'health_repository_impl.g.dart';

class HealthRepositoryImpl implements IHealthRepository {
  const HealthRepositoryImpl(this._datasource);

  final IHealthDatasource _datasource;

  // Fire-and-forget: un warmup fallido no es un error visible al user.
  // Excepción a la regla de relanzar como falla de dominio.
  @override
  Future<void> warmup() async {
    try {
      await _datasource.warmup();
    } on Object catch (_) {}
  }
}

@riverpod
IHealthRepository healthRepository(Ref ref) =>
    HealthRepositoryImpl(ref.watch(healthDatasourceProvider));
