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
    extends
        $FunctionalProvider<
          AsyncValue<List<Patient>>,
          AsyncValue<List<Patient>>,
          AsyncValue<List<Patient>>
        >
    with $Provider<AsyncValue<List<Patient>>> {
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
  $ProviderElement<AsyncValue<List<Patient>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Patient>> create(Ref ref) {
    return filteredPatients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Patient>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Patient>>>(value),
    );
  }
}

String _$filteredPatientsHash() => r'c9b399132c58f59367a3245819027cf493c39cff';
