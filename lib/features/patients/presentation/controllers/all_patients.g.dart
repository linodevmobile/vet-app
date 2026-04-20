// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_patients.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allPatients)
final allPatientsProvider = AllPatientsProvider._();

final class AllPatientsProvider
    extends $FunctionalProvider<List<Patient>, List<Patient>, List<Patient>>
    with $Provider<List<Patient>> {
  AllPatientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allPatientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allPatientsHash();

  @$internal
  @override
  $ProviderElement<List<Patient>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Patient> create(Ref ref) {
    return allPatients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Patient> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Patient>>(value),
    );
  }
}

String _$allPatientsHash() => r'7f0e24a3d375264c419238be377a2494d5bc9d85';
