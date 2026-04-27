import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/usecases/create_consultation_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';
import 'package:vet_app/features/consultation/presentation/controllers/active_consultation.dart';

part 'create_consultation_controller.g.dart';

@riverpod
CreateConsultationUseCase createConsultationUseCase(Ref ref) =>
    CreateConsultationUseCase(ref.watch(consultationRepositoryProvider));

/// Disparado por:
/// - "Nueva consulta" en PatientProfileView (con patientId existente).
/// - "Guardar y empezar consulta" en PatientCreateView (después del save de
///   paciente, con el patientId recién creado).
///
/// Al éxito setea `activeConsultation` y expone el consultationId — la View
/// lo lee con `ref.listen` para navegar a `/consultation/{id}`.
@riverpod
class CreateConsultationController extends _$CreateConsultationController {
  @override
  FutureOr<String?> build() => null;

  Future<void> create({
    required String patientId,
    String? type,
  }) async {
    state = const AsyncLoading();
    final guarded = await AsyncValue.guard(
      () => ref.read(createConsultationUseCaseProvider)(
        patientId: patientId,
        type: type,
      ),
    );
    if (!ref.mounted) return;
    if (guarded.hasError) {
      state = AsyncError(
        guarded.error!,
        guarded.stackTrace ?? StackTrace.current,
      );
      return;
    }
    final id = guarded.requireValue;
    ref.read(activeConsultationProvider.notifier).setId(id);
    state = AsyncData(id);
  }
}
