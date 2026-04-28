// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_patients.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listPatientsUseCase)
final listPatientsUseCaseProvider = ListPatientsUseCaseProvider._();

final class ListPatientsUseCaseProvider
    extends
        $FunctionalProvider<
          ListPatientsUseCase,
          ListPatientsUseCase,
          ListPatientsUseCase
        >
    with $Provider<ListPatientsUseCase> {
  ListPatientsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listPatientsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listPatientsUseCaseHash();

  @$internal
  @override
  $ProviderElement<ListPatientsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListPatientsUseCase create(Ref ref) {
    return listPatientsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListPatientsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListPatientsUseCase>(value),
    );
  }
}

String _$listPatientsUseCaseHash() =>
    r'f2e34fbfc78bfd9bc080940bd00bab6e97de9f7c';

@ProviderFor(AllPatients)
final allPatientsProvider = AllPatientsProvider._();

final class AllPatientsProvider
    extends $AsyncNotifierProvider<AllPatients, List<Patient>> {
  AllPatientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allPatientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allPatientsHash();

  @$internal
  @override
  AllPatients create() => AllPatients();
}

String _$allPatientsHash() => r'88d7a7255d45f5f0ab0382a98f051dd839b3e08e';

abstract class _$AllPatients extends $AsyncNotifier<List<Patient>> {
  FutureOr<List<Patient>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Patient>>, List<Patient>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Patient>>, List<Patient>>,
              AsyncValue<List<Patient>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
