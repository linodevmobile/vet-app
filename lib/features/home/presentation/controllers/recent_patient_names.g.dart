// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_patient_names.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentPatientNames)
final recentPatientNamesProvider = RecentPatientNamesProvider._();

final class RecentPatientNamesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  RecentPatientNamesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentPatientNamesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentPatientNamesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return recentPatientNames(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$recentPatientNamesHash() =>
    r'7dda3de76bdd760ad70e8252e3af317e40b72634';
