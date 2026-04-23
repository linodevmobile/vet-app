// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_consultations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRecentConsultationsUseCase)
final getRecentConsultationsUseCaseProvider =
    GetRecentConsultationsUseCaseProvider._();

final class GetRecentConsultationsUseCaseProvider
    extends
        $FunctionalProvider<
          GetRecentConsultationsUseCase,
          GetRecentConsultationsUseCase,
          GetRecentConsultationsUseCase
        >
    with $Provider<GetRecentConsultationsUseCase> {
  GetRecentConsultationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRecentConsultationsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRecentConsultationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetRecentConsultationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetRecentConsultationsUseCase create(Ref ref) {
    return getRecentConsultationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetRecentConsultationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetRecentConsultationsUseCase>(
        value,
      ),
    );
  }
}

String _$getRecentConsultationsUseCaseHash() =>
    r'6bd996b4d470abd6e4e4273539892bb1d829eba5';

@ProviderFor(RecentConsultations)
final recentConsultationsProvider = RecentConsultationsProvider._();

final class RecentConsultationsProvider
    extends
        $AsyncNotifierProvider<RecentConsultations, List<ConsultationRecord>> {
  RecentConsultationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentConsultationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentConsultationsHash();

  @$internal
  @override
  RecentConsultations create() => RecentConsultations();
}

String _$recentConsultationsHash() =>
    r'fa12e63c85bb796d96b1d697afe60415cba8502e';

abstract class _$RecentConsultations
    extends $AsyncNotifier<List<ConsultationRecord>> {
  FutureOr<List<ConsultationRecord>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ConsultationRecord>>,
              List<ConsultationRecord>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ConsultationRecord>>,
                List<ConsultationRecord>
              >,
              AsyncValue<List<ConsultationRecord>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
