// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultations_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(consultationsRepository)
final consultationsRepositoryProvider = ConsultationsRepositoryProvider._();

final class ConsultationsRepositoryProvider
    extends
        $FunctionalProvider<
          IConsultationsRepository,
          IConsultationsRepository,
          IConsultationsRepository
        >
    with $Provider<IConsultationsRepository> {
  ConsultationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IConsultationsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConsultationsRepository create(Ref ref) {
    return consultationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConsultationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConsultationsRepository>(value),
    );
  }
}

String _$consultationsRepositoryHash() =>
    r'f068bb45c2d28e4925fb7a6209c393d87357de2f';
