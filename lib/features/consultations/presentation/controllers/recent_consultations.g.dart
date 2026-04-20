// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_consultations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentConsultations)
final recentConsultationsProvider = RecentConsultationsProvider._();

final class RecentConsultationsProvider
    extends
        $FunctionalProvider<
          List<ConsultationRecord>,
          List<ConsultationRecord>,
          List<ConsultationRecord>
        >
    with $Provider<List<ConsultationRecord>> {
  RecentConsultationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentConsultationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentConsultationsHash();

  @$internal
  @override
  $ProviderElement<List<ConsultationRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ConsultationRecord> create(Ref ref) {
    return recentConsultations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ConsultationRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ConsultationRecord>>(value),
    );
  }
}

String _$recentConsultationsHash() =>
    r'94084ddcccb838af8ff605571a77df7ca0a87f4d';
