// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_process_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(processConsultationSectionUseCase)
final processConsultationSectionUseCaseProvider =
    ProcessConsultationSectionUseCaseProvider._();

final class ProcessConsultationSectionUseCaseProvider
    extends
        $FunctionalProvider<
          ProcessConsultationSectionUseCase,
          ProcessConsultationSectionUseCase,
          ProcessConsultationSectionUseCase
        >
    with $Provider<ProcessConsultationSectionUseCase> {
  ProcessConsultationSectionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'processConsultationSectionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$processConsultationSectionUseCaseHash();

  @$internal
  @override
  $ProviderElement<ProcessConsultationSectionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProcessConsultationSectionUseCase create(Ref ref) {
    return processConsultationSectionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProcessConsultationSectionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProcessConsultationSectionUseCase>(
        value,
      ),
    );
  }
}

String _$processConsultationSectionUseCaseHash() =>
    r'6c3d7cc9d5be0b916bb6c69e86df7c7808ae660a';

/// Escucha grabaciones recién terminadas (canal `consultationRecorderDelivery`),
/// las procesa contra `/ai/process-section` y expone el resultado tipado.
///
/// La View hace `ref.listen` sobre este provider para rellenar el campo
/// correspondiente, y `ref.watch` para mostrar feedback de "procesando" sobre
/// la sección activa.

@ProviderFor(ConsultationProcessController)
final consultationProcessControllerProvider =
    ConsultationProcessControllerProvider._();

/// Escucha grabaciones recién terminadas (canal `consultationRecorderDelivery`),
/// las procesa contra `/ai/process-section` y expone el resultado tipado.
///
/// La View hace `ref.listen` sobre este provider para rellenar el campo
/// correspondiente, y `ref.watch` para mostrar feedback de "procesando" sobre
/// la sección activa.
final class ConsultationProcessControllerProvider
    extends
        $NotifierProvider<
          ConsultationProcessController,
          AsyncValue<ConsultationProcessSuggestion?>
        > {
  /// Escucha grabaciones recién terminadas (canal `consultationRecorderDelivery`),
  /// las procesa contra `/ai/process-section` y expone el resultado tipado.
  ///
  /// La View hace `ref.listen` sobre este provider para rellenar el campo
  /// correspondiente, y `ref.watch` para mostrar feedback de "procesando" sobre
  /// la sección activa.
  ConsultationProcessControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationProcessControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationProcessControllerHash();

  @$internal
  @override
  ConsultationProcessController create() => ConsultationProcessController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ConsultationProcessSuggestion?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<ConsultationProcessSuggestion?>>(value),
    );
  }
}

String _$consultationProcessControllerHash() =>
    r'f444dabe54cda40be8ba75bee7c448a848533718';

/// Escucha grabaciones recién terminadas (canal `consultationRecorderDelivery`),
/// las procesa contra `/ai/process-section` y expone el resultado tipado.
///
/// La View hace `ref.listen` sobre este provider para rellenar el campo
/// correspondiente, y `ref.watch` para mostrar feedback de "procesando" sobre
/// la sección activa.

abstract class _$ConsultationProcessController
    extends $Notifier<AsyncValue<ConsultationProcessSuggestion?>> {
  AsyncValue<ConsultationProcessSuggestion?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ConsultationProcessSuggestion?>,
              AsyncValue<ConsultationProcessSuggestion?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ConsultationProcessSuggestion?>,
                AsyncValue<ConsultationProcessSuggestion?>
              >,
              AsyncValue<ConsultationProcessSuggestion?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
