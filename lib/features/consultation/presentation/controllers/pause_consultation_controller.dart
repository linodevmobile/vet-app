import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/usecases/pause_consultation_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';

part 'pause_consultation_controller.g.dart';

@riverpod
PauseConsultationUseCase pauseConsultationUseCase(Ref ref) =>
    PauseConsultationUseCase(ref.watch(consultationRepositoryProvider));

@riverpod
class PauseConsultationController extends _$PauseConsultationController {
  // Sync return: arranca en AsyncData(null) sin pasar por AsyncLoading.
  // Si fuera `Future<void> build() async {}`, la transición loading→data del
  // ciclo de vida inicial dispararía los listeners como si el usuario acabara
  // de pausar.
  @override
  FutureOr<void> build() {}

  Future<void> pause({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  }) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(pauseConsultationUseCaseProvider)(
        consultationId: consultationId,
        reason: reason,
        note: note,
      ),
    );
    if (!ref.mounted) return;
    state = result;
  }
}
