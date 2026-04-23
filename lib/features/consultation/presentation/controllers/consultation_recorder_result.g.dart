// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_recorder_result.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Canal one-shot: el recorder controller emite acá cuando termina un upload
/// con éxito. El `seq` fuerza el cambio de estado aunque `result` sea idéntico
/// al previo, así `ref.listen` dispara en la view cada vez.

@ProviderFor(ConsultationRecorderResult)
final consultationRecorderResultProvider =
    ConsultationRecorderResultProvider._();

/// Canal one-shot: el recorder controller emite acá cuando termina un upload
/// con éxito. El `seq` fuerza el cambio de estado aunque `result` sea idéntico
/// al previo, así `ref.listen` dispara en la view cada vez.
final class ConsultationRecorderResultProvider
    extends
        $NotifierProvider<
          ConsultationRecorderResult,
          ConsultationRecorderDelivery?
        > {
  /// Canal one-shot: el recorder controller emite acá cuando termina un upload
  /// con éxito. El `seq` fuerza el cambio de estado aunque `result` sea idéntico
  /// al previo, así `ref.listen` dispara en la view cada vez.
  ConsultationRecorderResultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationRecorderResultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationRecorderResultHash();

  @$internal
  @override
  ConsultationRecorderResult create() => ConsultationRecorderResult();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConsultationRecorderDelivery? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConsultationRecorderDelivery?>(
        value,
      ),
    );
  }
}

String _$consultationRecorderResultHash() =>
    r'5b1a6ae498707ee110ae138e265003853b4c65e0';

/// Canal one-shot: el recorder controller emite acá cuando termina un upload
/// con éxito. El `seq` fuerza el cambio de estado aunque `result` sea idéntico
/// al previo, así `ref.listen` dispara en la view cada vez.

abstract class _$ConsultationRecorderResult
    extends $Notifier<ConsultationRecorderDelivery?> {
  ConsultationRecorderDelivery? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              ConsultationRecorderDelivery?,
              ConsultationRecorderDelivery?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ConsultationRecorderDelivery?,
                ConsultationRecorderDelivery?
              >,
              ConsultationRecorderDelivery?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
