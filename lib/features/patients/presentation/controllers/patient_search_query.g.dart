// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_search_query.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PatientSearchQuery)
final patientSearchQueryProvider = PatientSearchQueryProvider._();

final class PatientSearchQueryProvider
    extends $NotifierProvider<PatientSearchQuery, String> {
  PatientSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientSearchQueryHash();

  @$internal
  @override
  PatientSearchQuery create() => PatientSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$patientSearchQueryHash() =>
    r'f22cd1f3c50259e97f057fb898b3a7cfb8cb3d36';

abstract class _$PatientSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
