// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPatientByIdUseCase)
final getPatientByIdUseCaseProvider = GetPatientByIdUseCaseProvider._();

final class GetPatientByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetPatientByIdUseCase,
          GetPatientByIdUseCase,
          GetPatientByIdUseCase
        >
    with $Provider<GetPatientByIdUseCase> {
  GetPatientByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPatientByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPatientByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPatientByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPatientByIdUseCase create(Ref ref) {
    return getPatientByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPatientByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPatientByIdUseCase>(value),
    );
  }
}

String _$getPatientByIdUseCaseHash() =>
    r'c6a8b68ce5b38775330fb55a054844269ca73f95';

@ProviderFor(PatientDetailController)
final patientDetailControllerProvider = PatientDetailControllerFamily._();

final class PatientDetailControllerProvider
    extends $AsyncNotifierProvider<PatientDetailController, Patient> {
  PatientDetailControllerProvider._({
    required PatientDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'patientDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientDetailControllerHash();

  @override
  String toString() {
    return r'patientDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PatientDetailController create() => PatientDetailController();

  @override
  bool operator ==(Object other) {
    return other is PatientDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientDetailControllerHash() =>
    r'4f768d0488cd3f1c9e01430004cdee0a1c76623a';

final class PatientDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PatientDetailController,
          AsyncValue<Patient>,
          Patient,
          FutureOr<Patient>,
          String
        > {
  PatientDetailControllerFamily._()
    : super(
        retry: null,
        name: r'patientDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientDetailControllerProvider call(String patientId) =>
      PatientDetailControllerProvider._(argument: patientId, from: this);

  @override
  String toString() => r'patientDetailControllerProvider';
}

abstract class _$PatientDetailController extends $AsyncNotifier<Patient> {
  late final _$args = ref.$arg as String;
  String get patientId => _$args;

  FutureOr<Patient> build(String patientId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Patient>, Patient>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Patient>, Patient>,
              AsyncValue<Patient>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
