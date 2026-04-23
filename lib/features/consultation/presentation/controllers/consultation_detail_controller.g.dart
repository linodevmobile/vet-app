// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getConsultationByIdUseCase)
final getConsultationByIdUseCaseProvider =
    GetConsultationByIdUseCaseProvider._();

final class GetConsultationByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetConsultationByIdUseCase,
          GetConsultationByIdUseCase,
          GetConsultationByIdUseCase
        >
    with $Provider<GetConsultationByIdUseCase> {
  GetConsultationByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getConsultationByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getConsultationByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetConsultationByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetConsultationByIdUseCase create(Ref ref) {
    return getConsultationByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetConsultationByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetConsultationByIdUseCase>(value),
    );
  }
}

String _$getConsultationByIdUseCaseHash() =>
    r'74604900798572979f1cf2a0a3b04507d365e248';

@ProviderFor(ConsultationDetailController)
final consultationDetailControllerProvider =
    ConsultationDetailControllerFamily._();

final class ConsultationDetailControllerProvider
    extends $AsyncNotifierProvider<ConsultationDetailController, Consultation> {
  ConsultationDetailControllerProvider._({
    required ConsultationDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'consultationDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$consultationDetailControllerHash();

  @override
  String toString() {
    return r'consultationDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConsultationDetailController create() => ConsultationDetailController();

  @override
  bool operator ==(Object other) {
    return other is ConsultationDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$consultationDetailControllerHash() =>
    r'f4c75c115e7e479dcb336980f60b9d64ecbc4c6b';

final class ConsultationDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ConsultationDetailController,
          AsyncValue<Consultation>,
          Consultation,
          FutureOr<Consultation>,
          String
        > {
  ConsultationDetailControllerFamily._()
    : super(
        retry: null,
        name: r'consultationDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ConsultationDetailControllerProvider call(String consultationId) =>
      ConsultationDetailControllerProvider._(
        argument: consultationId,
        from: this,
      );

  @override
  String toString() => r'consultationDetailControllerProvider';
}

abstract class _$ConsultationDetailController
    extends $AsyncNotifier<Consultation> {
  late final _$args = ref.$arg as String;
  String get consultationId => _$args;

  FutureOr<Consultation> build(String consultationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Consultation>, Consultation>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Consultation>, Consultation>,
              AsyncValue<Consultation>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
