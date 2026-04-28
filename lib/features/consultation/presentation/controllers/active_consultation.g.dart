// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_consultation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Guarda el `consultation_id` devuelto por la primera llamada a
/// `/consultation/process` (la de anamnesis). Las llamadas siguientes del
/// mismo flujo deben reenviarlo para que el backend amarre las secciones.

@ProviderFor(ActiveConsultation)
final activeConsultationProvider = ActiveConsultationProvider._();

/// Guarda el `consultation_id` devuelto por la primera llamada a
/// `/consultation/process` (la de anamnesis). Las llamadas siguientes del
/// mismo flujo deben reenviarlo para que el backend amarre las secciones.
final class ActiveConsultationProvider
    extends $NotifierProvider<ActiveConsultation, String?> {
  /// Guarda el `consultation_id` devuelto por la primera llamada a
  /// `/consultation/process` (la de anamnesis). Las llamadas siguientes del
  /// mismo flujo deben reenviarlo para que el backend amarre las secciones.
  ActiveConsultationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeConsultationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeConsultationHash();

  @$internal
  @override
  ActiveConsultation create() => ActiveConsultation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$activeConsultationHash() =>
    r'eb8c24a6873bb13261e9c2f88734847732e89bae';

/// Guarda el `consultation_id` devuelto por la primera llamada a
/// `/consultation/process` (la de anamnesis). Las llamadas siguientes del
/// mismo flujo deben reenviarlo para que el backend amarre las secciones.

abstract class _$ActiveConsultation extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
