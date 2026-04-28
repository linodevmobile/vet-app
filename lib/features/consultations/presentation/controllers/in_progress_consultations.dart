import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/in_progress_consultation.dart';
import 'package:vet_app/features/consultations/domain/usecases/get_in_progress_consultations_usecase.dart';
import 'package:vet_app/features/consultations/infrastructure/repositories/consultations_repository_impl.dart';

part 'in_progress_consultations.g.dart';

@riverpod
GetInProgressConsultationsUseCase getInProgressConsultationsUseCase(Ref ref) =>
    GetInProgressConsultationsUseCase(ref.watch(consultationsRepositoryProvider));

@riverpod
class InProgressConsultations extends _$InProgressConsultations {
  @override
  Future<List<InProgressConsultation>> build() =>
      ref.read(getInProgressConsultationsUseCaseProvider)();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getInProgressConsultationsUseCaseProvider)(),
    );
  }
}
