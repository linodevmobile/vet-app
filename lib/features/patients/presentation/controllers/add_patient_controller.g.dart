// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_patient_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createPatientUseCase)
final createPatientUseCaseProvider = CreatePatientUseCaseProvider._();

final class CreatePatientUseCaseProvider
    extends
        $FunctionalProvider<
          CreatePatientUseCase,
          CreatePatientUseCase,
          CreatePatientUseCase
        >
    with $Provider<CreatePatientUseCase> {
  CreatePatientUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createPatientUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createPatientUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreatePatientUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreatePatientUseCase create(Ref ref) {
    return createPatientUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreatePatientUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreatePatientUseCase>(value),
    );
  }
}

String _$createPatientUseCaseHash() =>
    r'14492619acfa56bb58386ba310a945a340ccff0f';

@ProviderFor(AddPatientController)
final addPatientControllerProvider = AddPatientControllerProvider._();

final class AddPatientControllerProvider
    extends $NotifierProvider<AddPatientController, AsyncValue<Patient?>> {
  AddPatientControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addPatientControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addPatientControllerHash();

  @$internal
  @override
  AddPatientController create() => AddPatientController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Patient?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Patient?>>(value),
    );
  }
}

String _$addPatientControllerHash() =>
    r'416c958f36d3fc8e7e77886efb54cc022d788314';

abstract class _$AddPatientController extends $Notifier<AsyncValue<Patient?>> {
  AsyncValue<Patient?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Patient?>, AsyncValue<Patient?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Patient?>, AsyncValue<Patient?>>,
              AsyncValue<Patient?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
