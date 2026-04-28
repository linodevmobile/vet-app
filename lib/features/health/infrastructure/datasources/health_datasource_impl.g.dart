// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthDatasource)
final healthDatasourceProvider = HealthDatasourceProvider._();

final class HealthDatasourceProvider
    extends
        $FunctionalProvider<
          IHealthDatasource,
          IHealthDatasource,
          IHealthDatasource
        >
    with $Provider<IHealthDatasource> {
  HealthDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthDatasourceHash();

  @$internal
  @override
  $ProviderElement<IHealthDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IHealthDatasource create(Ref ref) {
    return healthDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IHealthDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IHealthDatasource>(value),
    );
  }
}

String _$healthDatasourceHash() => r'a64bfe3ac30de03ca84ecc98114db25d3d0aefaf';
