import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/usecases/sync_consultation_section_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';

part 'consultation_sync_controller.g.dart';

@riverpod
SyncConsultationSectionUseCase syncConsultationSectionUseCase(Ref ref) =>
    SyncConsultationSectionUseCase(ref.watch(consultationRepositoryProvider));

/// Autosave por sección. La View lo invoca en blur/cambio de sección y al
/// pausar. El éxito silencioso es el caso esperado; los errores se muestran
/// con `DsToast` desde la View vía `ref.listen`.
@riverpod
class ConsultationSyncController extends _$ConsultationSyncController {
  @override
  FutureOr<void> build() {}

  Future<void> syncSection({
    required String consultationId,
    required ConsultationSection section,
    String? text,
    Map<String, dynamic>? content,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
    File? audio,
  }) async {
    state = const AsyncLoading();
    final guarded = await AsyncValue.guard(
      () => ref.read(syncConsultationSectionUseCaseProvider)(
        consultationId: consultationId,
        section: section,
        text: text,
        content: content,
        transcription: transcription,
        aiSuggested: aiSuggested,
        audio: audio,
      ),
    );
    if (!ref.mounted) return;
    state = guarded;
  }
}
