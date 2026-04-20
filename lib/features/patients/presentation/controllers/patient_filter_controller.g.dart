// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PatientFilterController)
final patientFilterControllerProvider = PatientFilterControllerProvider._();

final class PatientFilterControllerProvider
    extends $NotifierProvider<PatientFilterController, PatientFilter> {
  PatientFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientFilterControllerHash();

  @$internal
  @override
  PatientFilterController create() => PatientFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatientFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatientFilter>(value),
    );
  }
}

String _$patientFilterControllerHash() =>
    r'6a65888793d7c4d62da14d3b096c5a3849f7bd30';

abstract class _$PatientFilterController extends $Notifier<PatientFilter> {
  PatientFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PatientFilter, PatientFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PatientFilter, PatientFilter>,
              PatientFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
