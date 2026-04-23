// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_consultation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signConsultationUseCase)
final signConsultationUseCaseProvider = SignConsultationUseCaseProvider._();

final class SignConsultationUseCaseProvider
    extends
        $FunctionalProvider<
          SignConsultationUseCase,
          SignConsultationUseCase,
          SignConsultationUseCase
        >
    with $Provider<SignConsultationUseCase> {
  SignConsultationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signConsultationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signConsultationUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignConsultationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignConsultationUseCase create(Ref ref) {
    return signConsultationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignConsultationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignConsultationUseCase>(value),
    );
  }
}

String _$signConsultationUseCaseHash() =>
    r'7549006bab3a2e53315767915c32abd80779d088';

@ProviderFor(SignConsultationController)
final signConsultationControllerProvider =
    SignConsultationControllerProvider._();

final class SignConsultationControllerProvider
    extends $AsyncNotifierProvider<SignConsultationController, void> {
  SignConsultationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signConsultationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signConsultationControllerHash();

  @$internal
  @override
  SignConsultationController create() => SignConsultationController();
}

String _$signConsultationControllerHash() =>
    r'36a04aea29421c6000024fdf35c90c13761be7de';

abstract class _$SignConsultationController extends $AsyncNotifier<void> {
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
