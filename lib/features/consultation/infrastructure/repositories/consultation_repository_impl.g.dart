// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(consultationRepository)
final consultationRepositoryProvider = ConsultationRepositoryProvider._();

final class ConsultationRepositoryProvider
    extends
        $FunctionalProvider<
          IConsultationRepository,
          IConsultationRepository,
          IConsultationRepository
        >
    with $Provider<IConsultationRepository> {
  ConsultationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationRepositoryHash();

  @$internal
  @override
  $ProviderElement<IConsultationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConsultationRepository create(Ref ref) {
    return consultationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConsultationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConsultationRepository>(value),
    );
  }
}

String _$consultationRepositoryHash() =>
    r'af4d090a4d9f066ebe875924fbdaa6c56a5578c3';
