// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientsRepository)
final patientsRepositoryProvider = PatientsRepositoryProvider._();

final class PatientsRepositoryProvider
    extends
        $FunctionalProvider<
          IPatientsRepository,
          IPatientsRepository,
          IPatientsRepository
        >
    with $Provider<IPatientsRepository> {
  PatientsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IPatientsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPatientsRepository create(Ref ref) {
    return patientsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPatientsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPatientsRepository>(value),
    );
  }
}

String _$patientsRepositoryHash() =>
    r'35af252636943e2fd48f3e93c2c79fd419831b5c';
