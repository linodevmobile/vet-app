// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_header_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardHeader)
final dashboardHeaderProvider = DashboardHeaderProvider._();

final class DashboardHeaderProvider
    extends
        $FunctionalProvider<DashboardHeader, DashboardHeader, DashboardHeader>
    with $Provider<DashboardHeader> {
  DashboardHeaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardHeaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardHeaderHash();

  @$internal
  @override
  $ProviderElement<DashboardHeader> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardHeader create(Ref ref) {
    return dashboardHeader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardHeader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardHeader>(value),
    );
  }
}

String _$dashboardHeaderHash() => r'f78836a73010ff606014c1df07095b8ffcdfbfcd';
