// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientsDatasource)
final patientsDatasourceProvider = PatientsDatasourceProvider._();

final class PatientsDatasourceProvider
    extends
        $FunctionalProvider<
          IPatientsDatasource,
          IPatientsDatasource,
          IPatientsDatasource
        >
    with $Provider<IPatientsDatasource> {
  PatientsDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientsDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientsDatasourceHash();

  @$internal
  @override
  $ProviderElement<IPatientsDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPatientsDatasource create(Ref ref) {
    return patientsDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPatientsDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPatientsDatasource>(value),
    );
  }
}

String _$patientsDatasourceHash() =>
    r'544f086d4352d30b4f36f39da42640c50be0b58b';
