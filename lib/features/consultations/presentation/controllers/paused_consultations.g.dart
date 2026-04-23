// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paused_consultations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPausedConsultationsUseCase)
final getPausedConsultationsUseCaseProvider =
    GetPausedConsultationsUseCaseProvider._();

final class GetPausedConsultationsUseCaseProvider
    extends
        $FunctionalProvider<
          GetPausedConsultationsUseCase,
          GetPausedConsultationsUseCase,
          GetPausedConsultationsUseCase
        >
    with $Provider<GetPausedConsultationsUseCase> {
  GetPausedConsultationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPausedConsultationsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPausedConsultationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPausedConsultationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPausedConsultationsUseCase create(Ref ref) {
    return getPausedConsultationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPausedConsultationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPausedConsultationsUseCase>(
        value,
      ),
    );
  }
}

String _$getPausedConsultationsUseCaseHash() =>
    r'bd796734e6f62d6afb1c16570e8cf2f19c754584';

@ProviderFor(PausedConsultations)
final pausedConsultationsProvider = PausedConsultationsProvider._();

final class PausedConsultationsProvider
    extends
        $AsyncNotifierProvider<PausedConsultations, List<PausedConsultation>> {
  PausedConsultationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pausedConsultationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pausedConsultationsHash();

  @$internal
  @override
  PausedConsultations create() => PausedConsultations();
}

String _$pausedConsultationsHash() =>
    r'5e6859451c60345703f15a0f4e798567bf0f0785';

abstract class _$PausedConsultations
    extends $AsyncNotifier<List<PausedConsultation>> {
  FutureOr<List<PausedConsultation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PausedConsultation>>,
              List<PausedConsultation>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PausedConsultation>>,
                List<PausedConsultation>
              >,
              AsyncValue<List<PausedConsultation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
