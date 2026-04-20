// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_patients.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredPatients)
final filteredPatientsProvider = FilteredPatientsProvider._();

final class FilteredPatientsProvider
    extends $FunctionalProvider<List<Patient>, List<Patient>, List<Patient>>
    with $Provider<List<Patient>> {
  FilteredPatientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredPatientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredPatientsHash();

  @$internal
  @override
  $ProviderElement<List<Patient>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Patient> create(Ref ref) {
    return filteredPatients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Patient> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Patient>>(value),
    );
  }
}

String _$filteredPatientsHash() => r'5f73eb684dabc6b82b0104e5e207a89aed4ae8f5';
