// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consultation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createConsultationUseCase)
final createConsultationUseCaseProvider = CreateConsultationUseCaseProvider._();

final class CreateConsultationUseCaseProvider
    extends
        $FunctionalProvider<
          CreateConsultationUseCase,
          CreateConsultationUseCase,
          CreateConsultationUseCase
        >
    with $Provider<CreateConsultationUseCase> {
  CreateConsultationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createConsultationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createConsultationUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateConsultationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateConsultationUseCase create(Ref ref) {
    return createConsultationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateConsultationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateConsultationUseCase>(value),
    );
  }
}

String _$createConsultationUseCaseHash() =>
    r'62b5c8e0e31f09f080745eef564a6703f1c94295';

/// Disparado por:
/// - "Nueva consulta" en PatientProfileView (con patientId existente).
/// - "Guardar y empezar consulta" en PatientCreateView (después del save de
///   paciente, con el patientId recién creado).
///
/// Al éxito setea `activeConsultation` y expone el consultationId — la View
/// lo lee con `ref.listen` para navegar a `/consultation/{id}`.

@ProviderFor(CreateConsultationController)
final createConsultationControllerProvider =
    CreateConsultationControllerProvider._();

/// Disparado por:
/// - "Nueva consulta" en PatientProfileView (con patientId existente).
/// - "Guardar y empezar consulta" en PatientCreateView (después del save de
///   paciente, con el patientId recién creado).
///
/// Al éxito setea `activeConsultation` y expone el consultationId — la View
/// lo lee con `ref.listen` para navegar a `/consultation/{id}`.
final class CreateConsultationControllerProvider
    extends $AsyncNotifierProvider<CreateConsultationController, String?> {
  /// Disparado por:
  /// - "Nueva consulta" en PatientProfileView (con patientId existente).
  /// - "Guardar y empezar consulta" en PatientCreateView (después del save de
  ///   paciente, con el patientId recién creado).
  ///
  /// Al éxito setea `activeConsultation` y expone el consultationId — la View
  /// lo lee con `ref.listen` para navegar a `/consultation/{id}`.
  CreateConsultationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createConsultationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createConsultationControllerHash();

  @$internal
  @override
  CreateConsultationController create() => CreateConsultationController();
}

String _$createConsultationControllerHash() =>
    r'c1d224e0588a2610a7ea0f0d488d04b2fe9bb803';

/// Disparado por:
/// - "Nueva consulta" en PatientProfileView (con patientId existente).
/// - "Guardar y empezar consulta" en PatientCreateView (después del save de
///   paciente, con el patientId recién creado).
///
/// Al éxito setea `activeConsultation` y expone el consultationId — la View
/// lo lee con `ref.listen` para navegar a `/consultation/{id}`.

abstract class _$CreateConsultationController extends $AsyncNotifier<String?> {
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
