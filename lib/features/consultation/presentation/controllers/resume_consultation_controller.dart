import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/usecases/resume_consultation_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';

part 'resume_consultation_controller.g.dart';

@riverpod
ResumeConsultationUseCase resumeConsultationUseCase(Ref ref) =>
    ResumeConsultationUseCase(ref.watch(consultationRepositoryProvider));

@riverpod
class ResumeConsultationController extends _$ResumeConsultationController {
  // Sync return: evita la transición loading→data falsa al montar.
  // Ver feedback memory "AsyncNotifier con build() async dispara listeners".
  // El id se emite en success para que el listener sepa a dónde navegar.
  @override
  FutureOr<String?> build() => null;

  Future<void> resume(String consultationId) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      await ref.read(resumeConsultationUseCaseProvider)(consultationId);
      return consultationId;
    });
    if (!ref.mounted) return;
    state = result;
  }
}
