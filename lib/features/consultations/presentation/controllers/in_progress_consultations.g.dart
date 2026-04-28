// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_progress_consultations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getInProgressConsultationsUseCase)
final getInProgressConsultationsUseCaseProvider =
    GetInProgressConsultationsUseCaseProvider._();

final class GetInProgressConsultationsUseCaseProvider
    extends
        $FunctionalProvider<
          GetInProgressConsultationsUseCase,
          GetInProgressConsultationsUseCase,
          GetInProgressConsultationsUseCase
        >
    with $Provider<GetInProgressConsultationsUseCase> {
  GetInProgressConsultationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getInProgressConsultationsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$getInProgressConsultationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetInProgressConsultationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetInProgressConsultationsUseCase create(Ref ref) {
    return getInProgressConsultationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetInProgressConsultationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetInProgressConsultationsUseCase>(
        value,
      ),
    );
  }
}

String _$getInProgressConsultationsUseCaseHash() =>
    r'b7e2bb89689721055f5c2e623aaf5b599f23656a';

@ProviderFor(InProgressConsultations)
final inProgressConsultationsProvider = InProgressConsultationsProvider._();

final class InProgressConsultationsProvider
    extends
        $AsyncNotifierProvider<
          InProgressConsultations,
          List<InProgressConsultation>
        > {
  InProgressConsultationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inProgressConsultationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inProgressConsultationsHash();

  @$internal
  @override
  InProgressConsultations create() => InProgressConsultations();
}

String _$inProgressConsultationsHash() =>
    r'70c4fe0fdc733f280a8c188dfb379d0153f32899';

abstract class _$InProgressConsultations
    extends $AsyncNotifier<List<InProgressConsultation>> {
  FutureOr<List<InProgressConsultation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<InProgressConsultation>>,
              List<InProgressConsultation>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<InProgressConsultation>>,
                List<InProgressConsultation>
              >,
              AsyncValue<List<InProgressConsultation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
