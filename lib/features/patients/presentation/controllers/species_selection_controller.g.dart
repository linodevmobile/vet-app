// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_selection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SpeciesSelectionController)
final speciesSelectionControllerProvider =
    SpeciesSelectionControllerProvider._();

final class SpeciesSelectionControllerProvider
    extends $NotifierProvider<SpeciesSelectionController, Species> {
  SpeciesSelectionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'speciesSelectionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$speciesSelectionControllerHash();

  @$internal
  @override
  SpeciesSelectionController create() => SpeciesSelectionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Species value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Species>(value),
    );
  }
}

String _$speciesSelectionControllerHash() =>
    r'26c8e8f627037a451b4ad5791caa468bf2daf218';

abstract class _$SpeciesSelectionController extends $Notifier<Species> {
  Species build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Species, Species>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Species, Species>,
              Species,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
