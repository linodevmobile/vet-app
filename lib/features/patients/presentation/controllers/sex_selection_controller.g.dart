// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sex_selection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SexSelectionController)
final sexSelectionControllerProvider = SexSelectionControllerProvider._();

final class SexSelectionControllerProvider
    extends $NotifierProvider<SexSelectionController, Sex> {
  SexSelectionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sexSelectionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sexSelectionControllerHash();

  @$internal
  @override
  SexSelectionController create() => SexSelectionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Sex value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Sex>(value),
    );
  }
}

String _$sexSelectionControllerHash() =>
    r'5633627d8e869451bd48da2fc301ecbc69fbce92';

abstract class _$SexSelectionController extends $Notifier<Sex> {
  Sex build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Sex, Sex>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Sex, Sex>,
              Sex,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
