import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/health/domain/datasources/health_datasource.dart';
import 'package:vet_app/features/health/infrastructure/api/health_api.dart';

part 'health_datasource_impl.g.dart';

class HealthDatasourceImpl implements IHealthDatasource {
  const HealthDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<void> warmup() => _api.get(HealthApi.warmup);
}

@riverpod
IHealthDatasource healthDatasource(Ref ref) =>
    HealthDatasourceImpl(ref.watch(apiServiceProvider));
