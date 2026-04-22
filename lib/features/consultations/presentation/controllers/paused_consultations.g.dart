// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paused_consultations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pausedConsultations)
final pausedConsultationsProvider = PausedConsultationsProvider._();

final class PausedConsultationsProvider
    extends
        $FunctionalProvider<
          List<PausedConsultation>,
          List<PausedConsultation>,
          List<PausedConsultation>
        >
    with $Provider<List<PausedConsultation>> {
  PausedConsultationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pausedConsultationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pausedConsultationsHash();

  @$internal
  @override
  $ProviderElement<List<PausedConsultation>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PausedConsultation> create(Ref ref) {
    return pausedConsultations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PausedConsultation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PausedConsultation>>(value),
    );
  }
}

String _$pausedConsultationsHash() =>
    r'3d25dcff976d94f8d7e852263ed1f1bd8ae68087';
