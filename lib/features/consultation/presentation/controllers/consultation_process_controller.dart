import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/usecases/process_consultation_section_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_processing_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_delivery.dart';

part 'consultation_process_controller.g.dart';

typedef ConsultationProcessSuggestion = ({
  ConsultationSection section,
  ConsultationProcessResult outcome,
  int seq,
});

@riverpod
ProcessConsultationSectionUseCase processConsultationSectionUseCase(Ref ref) =>
    ProcessConsultationSectionUseCase(ref.watch(consultationRepositoryProvider));

/// Escucha grabaciones recién terminadas (canal `consultationRecorderDelivery`),
/// las procesa contra `/ai/process-section` y expone el resultado tipado.
///
/// La View hace `ref.listen` sobre este provider para rellenar el campo
/// correspondiente, y `ref.watch` para mostrar feedback de "procesando" sobre
/// la sección activa.
@riverpod
class ConsultationProcessController extends _$ConsultationProcessController {
  int _seq = 0;

  @override
  AsyncValue<ConsultationProcessSuggestion?> build() {
    ref.listen<ConsultationRecorderDelivery?>(
      consultationRecorderDeliveryProvider,
      (_, next) {
        if (next == null) return;
        unawaited(_process(next));
      },
    );
    return const AsyncData(null);
  }

  Future<void> _process(ConsultationRecorderDelivery delivery) async {
    state = const AsyncLoading();
    ref
        .read(consultationProcessingSectionProvider.notifier)
        .start(delivery.section);
    final useCase = ref.read(processConsultationSectionUseCaseProvider);
    final guarded = await AsyncValue.guard(
      () => useCase(section: delivery.section, audio: delivery.audio),
    );
    if (!ref.mounted) {
      await _safeDelete(delivery.audio);
      return;
    }
    ref.read(consultationProcessingSectionProvider.notifier).clear();
    if (guarded.hasError) {
      state = AsyncError(
        guarded.error!,
        guarded.stackTrace ?? StackTrace.current,
      );
    } else {
      _seq += 1;
      state = AsyncData(
        (
          section: delivery.section,
          outcome: guarded.requireValue,
          seq: _seq,
        ),
      );
    }
    await _safeDelete(delivery.audio);
  }

  Future<void> _safeDelete(File file) async {
    if (!file.existsSync()) return;
    await AsyncValue.guard(file.delete);
  }
}
