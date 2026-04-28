// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConsultationFormController)
final consultationFormControllerProvider = ConsultationFormControllerFamily._();

final class ConsultationFormControllerProvider
    extends
        $NotifierProvider<ConsultationFormController, ConsultationFormState> {
  ConsultationFormControllerProvider._({
    required ConsultationFormControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'consultationFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$consultationFormControllerHash();

  @override
  String toString() {
    return r'consultationFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConsultationFormController create() => ConsultationFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConsultationFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConsultationFormState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConsultationFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$consultationFormControllerHash() =>
    r'6094d8ff1e0f243dfebd349dd2272cfe98ccfe15';

final class ConsultationFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ConsultationFormController,
          ConsultationFormState,
          ConsultationFormState,
          ConsultationFormState,
          String
        > {
  ConsultationFormControllerFamily._()
    : super(
        retry: null,
        name: r'consultationFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ConsultationFormControllerProvider call(String consultationId) =>
      ConsultationFormControllerProvider._(
        argument: consultationId,
        from: this,
      );

  @override
  String toString() => r'consultationFormControllerProvider';
}

abstract class _$ConsultationFormController
    extends $Notifier<ConsultationFormState> {
  late final _$args = ref.$arg as String;
  String get consultationId => _$args;

  ConsultationFormState build(String consultationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ConsultationFormState, ConsultationFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConsultationFormState, ConsultationFormState>,
              ConsultationFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
