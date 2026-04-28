// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_sync_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncConsultationSectionUseCase)
final syncConsultationSectionUseCaseProvider =
    SyncConsultationSectionUseCaseProvider._();

final class SyncConsultationSectionUseCaseProvider
    extends
        $FunctionalProvider<
          SyncConsultationSectionUseCase,
          SyncConsultationSectionUseCase,
          SyncConsultationSectionUseCase
        >
    with $Provider<SyncConsultationSectionUseCase> {
  SyncConsultationSectionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncConsultationSectionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncConsultationSectionUseCaseHash();

  @$internal
  @override
  $ProviderElement<SyncConsultationSectionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncConsultationSectionUseCase create(Ref ref) {
    return syncConsultationSectionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncConsultationSectionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncConsultationSectionUseCase>(
        value,
      ),
    );
  }
}

String _$syncConsultationSectionUseCaseHash() =>
    r'ac2f75b9df41f7a3b490abc0f0516021c58eb10b';

/// Autosave por sección. La View lo invoca en blur/cambio de sección y al
/// pausar. El éxito silencioso es el caso esperado; los errores se muestran
/// con `DsToast` desde la View vía `ref.listen`.

@ProviderFor(ConsultationSyncController)
final consultationSyncControllerProvider =
    ConsultationSyncControllerProvider._();

/// Autosave por sección. La View lo invoca en blur/cambio de sección y al
/// pausar. El éxito silencioso es el caso esperado; los errores se muestran
/// con `DsToast` desde la View vía `ref.listen`.
final class ConsultationSyncControllerProvider
    extends $AsyncNotifierProvider<ConsultationSyncController, void> {
  /// Autosave por sección. La View lo invoca en blur/cambio de sección y al
  /// pausar. El éxito silencioso es el caso esperado; los errores se muestran
  /// con `DsToast` desde la View vía `ref.listen`.
  ConsultationSyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationSyncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationSyncControllerHash();

  @$internal
  @override
  ConsultationSyncController create() => ConsultationSyncController();
}

String _$consultationSyncControllerHash() =>
    r'e824aef2c6ddb50f294338a3350ca4ef5fc2cd2c';

/// Autosave por sección. La View lo invoca en blur/cambio de sección y al
/// pausar. El éxito silencioso es el caso esperado; los errores se muestran
/// con `DsToast` desde la View vía `ref.listen`.

abstract class _$ConsultationSyncController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
