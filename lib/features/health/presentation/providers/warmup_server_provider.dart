import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/health/domain/usecases/warmup_server_usecase.dart';
import 'package:vet_app/features/health/infrastructure/repositories/health_repository_impl.dart';

part 'warmup_server_provider.g.dart';

@riverpod
WarmupServerUseCase warmupServerUseCase(Ref ref) =>
    WarmupServerUseCase(ref.watch(healthRepositoryProvider));
