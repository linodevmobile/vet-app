// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debounced_patient_search_query.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DebouncedPatientSearchQuery)
final debouncedPatientSearchQueryProvider =
    DebouncedPatientSearchQueryProvider._();

final class DebouncedPatientSearchQueryProvider
    extends $NotifierProvider<DebouncedPatientSearchQuery, String> {
  DebouncedPatientSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debouncedPatientSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debouncedPatientSearchQueryHash();

  @$internal
  @override
  DebouncedPatientSearchQuery create() => DebouncedPatientSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$debouncedPatientSearchQueryHash() =>
    r'8f530767cb6bd9babe922b07774040126efc1c59';

abstract class _$DebouncedPatientSearchQuery extends $Notifier<String> {
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
