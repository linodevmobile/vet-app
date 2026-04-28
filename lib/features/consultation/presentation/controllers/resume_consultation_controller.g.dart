// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_consultation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resumeConsultationUseCase)
final resumeConsultationUseCaseProvider = ResumeConsultationUseCaseProvider._();

final class ResumeConsultationUseCaseProvider
    extends
        $FunctionalProvider<
          ResumeConsultationUseCase,
          ResumeConsultationUseCase,
          ResumeConsultationUseCase
        >
    with $Provider<ResumeConsultationUseCase> {
  ResumeConsultationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resumeConsultationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resumeConsultationUseCaseHash();

  @$internal
  @override
  $ProviderElement<ResumeConsultationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResumeConsultationUseCase create(Ref ref) {
    return resumeConsultationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResumeConsultationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResumeConsultationUseCase>(value),
    );
  }
}

String _$resumeConsultationUseCaseHash() =>
    r'b44daafb47f3297ab1d90dc73a1b18918d7cfd07';

@ProviderFor(ResumeConsultationController)
final resumeConsultationControllerProvider =
    ResumeConsultationControllerProvider._();

final class ResumeConsultationControllerProvider
    extends $AsyncNotifierProvider<ResumeConsultationController, String?> {
  ResumeConsultationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resumeConsultationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resumeConsultationControllerHash();

  @$internal
  @override
  ResumeConsultationController create() => ResumeConsultationController();
}

String _$resumeConsultationControllerHash() =>
    r'cbaffe2e384cbd4c4323e15499fb577845d758a4';

abstract class _$ResumeConsultationController extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
