import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/usecases/get_recent_consultations_usecase.dart';
import 'package:vet_app/features/consultations/infrastructure/repositories/consultations_repository_impl.dart';

part 'recent_consultations.g.dart';

@riverpod
GetRecentConsultationsUseCase getRecentConsultationsUseCase(Ref ref) =>
    GetRecentConsultationsUseCase(ref.watch(consultationsRepositoryProvider));

@riverpod
class RecentConsultations extends _$RecentConsultations {
  @override
  Future<List<ConsultationRecord>> build() =>
      ref.read(getRecentConsultationsUseCaseProvider)();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getRecentConsultationsUseCaseProvider)(),
    );
  }
}
