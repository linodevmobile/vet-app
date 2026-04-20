// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_hospitalizations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeHospitalizations)
final activeHospitalizationsProvider = ActiveHospitalizationsProvider._();

final class ActiveHospitalizationsProvider
    extends
        $FunctionalProvider<
          List<HospitalizedPatient>,
          List<HospitalizedPatient>,
          List<HospitalizedPatient>
        >
    with $Provider<List<HospitalizedPatient>> {
  ActiveHospitalizationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeHospitalizationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeHospitalizationsHash();

  @$internal
  @override
  $ProviderElement<List<HospitalizedPatient>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HospitalizedPatient> create(Ref ref) {
    return activeHospitalizations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HospitalizedPatient> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HospitalizedPatient>>(value),
    );
  }
}

String _$activeHospitalizationsHash() =>
    r'1372a981940c34ce05851b32e84681909328a1c2';
