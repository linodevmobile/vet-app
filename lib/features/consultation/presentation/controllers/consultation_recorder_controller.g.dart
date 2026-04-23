// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_recorder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(processConsultationAudioUseCase)
final processConsultationAudioUseCaseProvider =
    ProcessConsultationAudioUseCaseProvider._();

final class ProcessConsultationAudioUseCaseProvider
    extends
        $FunctionalProvider<
          ProcessConsultationAudioUseCase,
          ProcessConsultationAudioUseCase,
          ProcessConsultationAudioUseCase
        >
    with $Provider<ProcessConsultationAudioUseCase> {
  ProcessConsultationAudioUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'processConsultationAudioUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$processConsultationAudioUseCaseHash();

  @$internal
  @override
  $ProviderElement<ProcessConsultationAudioUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProcessConsultationAudioUseCase create(Ref ref) {
    return processConsultationAudioUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProcessConsultationAudioUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProcessConsultationAudioUseCase>(
        value,
      ),
    );
  }
}

String _$processConsultationAudioUseCaseHash() =>
    r'8dd44f2b2fa72800a8926f75d3be093b53fd0379';

@ProviderFor(ConsultationRecorderController)
final consultationRecorderControllerProvider =
    ConsultationRecorderControllerProvider._();

final class ConsultationRecorderControllerProvider
    extends
        $AsyncNotifierProvider<
          ConsultationRecorderController,
          ConsultationRecorderState
        > {
  ConsultationRecorderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationRecorderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationRecorderControllerHash();

  @$internal
  @override
  ConsultationRecorderController create() => ConsultationRecorderController();
}

String _$consultationRecorderControllerHash() =>
    r'9c1edb87a512cb5189d6080f529f9893eb4f5e61';

abstract class _$ConsultationRecorderController
    extends $AsyncNotifier<ConsultationRecorderState> {
  FutureOr<ConsultationRecorderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ConsultationRecorderState>,
              ConsultationRecorderState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ConsultationRecorderState>,
                ConsultationRecorderState
              >,
              AsyncValue<ConsultationRecorderState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
