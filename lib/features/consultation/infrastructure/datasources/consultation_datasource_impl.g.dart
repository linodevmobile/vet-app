// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(consultationDatasource)
final consultationDatasourceProvider = ConsultationDatasourceProvider._();

final class ConsultationDatasourceProvider
    extends
        $FunctionalProvider<
          IConsultationDatasource,
          IConsultationDatasource,
          IConsultationDatasource
        >
    with $Provider<IConsultationDatasource> {
  ConsultationDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationDatasourceHash();

  @$internal
  @override
  $ProviderElement<IConsultationDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConsultationDatasource create(Ref ref) {
    return consultationDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConsultationDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConsultationDatasource>(value),
    );
  }
}

String _$consultationDatasourceHash() =>
    r'dff9ed78f5ea21d2b3346f18b41f5da5991e8784';
