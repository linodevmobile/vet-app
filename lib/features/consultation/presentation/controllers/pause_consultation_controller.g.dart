// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pause_consultation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pauseConsultationUseCase)
final pauseConsultationUseCaseProvider = PauseConsultationUseCaseProvider._();

final class PauseConsultationUseCaseProvider
    extends
        $FunctionalProvider<
          PauseConsultationUseCase,
          PauseConsultationUseCase,
          PauseConsultationUseCase
        >
    with $Provider<PauseConsultationUseCase> {
  PauseConsultationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pauseConsultationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pauseConsultationUseCaseHash();

  @$internal
  @override
  $ProviderElement<PauseConsultationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PauseConsultationUseCase create(Ref ref) {
    return pauseConsultationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PauseConsultationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PauseConsultationUseCase>(value),
    );
  }
}

String _$pauseConsultationUseCaseHash() =>
    r'df51e3aa3fc4b90200d1c5e41a1ee16725408ccb';

@ProviderFor(PauseConsultationController)
final pauseConsultationControllerProvider =
    PauseConsultationControllerProvider._();

final class PauseConsultationControllerProvider
    extends $AsyncNotifierProvider<PauseConsultationController, void> {
  PauseConsultationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pauseConsultationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pauseConsultationControllerHash();

  @$internal
  @override
  PauseConsultationController create() => PauseConsultationController();
}

String _$pauseConsultationControllerHash() =>
    r'dd07a3d297195af3cdbe1704ae5337e2c66af046';

abstract class _$PauseConsultationController extends $AsyncNotifier<void> {
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
