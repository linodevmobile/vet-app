// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultations_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(consultationsDatasource)
final consultationsDatasourceProvider = ConsultationsDatasourceProvider._();

final class ConsultationsDatasourceProvider
    extends
        $FunctionalProvider<
          IConsultationsDatasource,
          IConsultationsDatasource,
          IConsultationsDatasource
        >
    with $Provider<IConsultationsDatasource> {
  ConsultationsDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationsDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationsDatasourceHash();

  @$internal
  @override
  $ProviderElement<IConsultationsDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConsultationsDatasource create(Ref ref) {
    return consultationsDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConsultationsDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConsultationsDatasource>(value),
    );
  }
}

String _$consultationsDatasourceHash() =>
    r'c8a23cc3db091dc938343d19a2f596d3c12b426a';
