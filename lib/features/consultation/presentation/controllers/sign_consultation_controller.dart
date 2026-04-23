import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/usecases/sign_consultation_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';

part 'sign_consultation_controller.g.dart';

@riverpod
SignConsultationUseCase signConsultationUseCase(Ref ref) =>
    SignConsultationUseCase(ref.watch(consultationRepositoryProvider));

@riverpod
class SignConsultationController extends _$SignConsultationController {
  @override
  Future<void> build() async {}

  Future<void> sign({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  }) async {
    state = const AsyncLoading();
    final guarded = await AsyncValue.guard(
      () => ref.read(signConsultationUseCaseProvider)(
        consultationId: consultationId,
        result: result,
        summary: summary,
        primaryDiagnosis: primaryDiagnosis,
      ),
    );
    if (!ref.mounted) return;
    state = guarded;
  }
}
