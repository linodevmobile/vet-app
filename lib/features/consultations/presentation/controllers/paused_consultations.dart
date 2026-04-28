import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/consultations/domain/usecases/get_paused_consultations_usecase.dart';
import 'package:vet_app/features/consultations/infrastructure/repositories/consultations_repository_impl.dart';

part 'paused_consultations.g.dart';

@riverpod
GetPausedConsultationsUseCase getPausedConsultationsUseCase(Ref ref) =>
    GetPausedConsultationsUseCase(ref.watch(consultationsRepositoryProvider));

@riverpod
class PausedConsultations extends _$PausedConsultations {
  @override
  Future<List<PausedConsultation>> build() =>
      ref.read(getPausedConsultationsUseCaseProvider)();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getPausedConsultationsUseCaseProvider)(),
    );
  }
}
