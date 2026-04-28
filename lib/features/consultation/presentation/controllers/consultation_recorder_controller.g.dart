// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_recorder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'59196df927370c110eb0decd793b6b673e1c5b9c';

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
