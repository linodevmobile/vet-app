// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_recorder_delivery.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Canal one-shot: el recorder emite acá cuando termina la grabación con
/// éxito. El `seq` fuerza cambio de estado aunque el archivo se repita, así
/// `ref.listen` dispara siempre y el process controller no pierde una entrega.

@ProviderFor(ConsultationRecorderDeliveryNotifier)
final consultationRecorderDeliveryProvider =
    ConsultationRecorderDeliveryNotifierProvider._();

/// Canal one-shot: el recorder emite acá cuando termina la grabación con
/// éxito. El `seq` fuerza cambio de estado aunque el archivo se repita, así
/// `ref.listen` dispara siempre y el process controller no pierde una entrega.
final class ConsultationRecorderDeliveryNotifierProvider
    extends
        $NotifierProvider<
          ConsultationRecorderDeliveryNotifier,
          ConsultationRecorderDelivery?
        > {
  /// Canal one-shot: el recorder emite acá cuando termina la grabación con
  /// éxito. El `seq` fuerza cambio de estado aunque el archivo se repita, así
  /// `ref.listen` dispara siempre y el process controller no pierde una entrega.
  ConsultationRecorderDeliveryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationRecorderDeliveryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$consultationRecorderDeliveryNotifierHash();

  @$internal
  @override
  ConsultationRecorderDeliveryNotifier create() =>
      ConsultationRecorderDeliveryNotifier();

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

String _$consultationRecorderDeliveryNotifierHash() =>
    r'c7cfdd8853ea2900c3408af5d09c4c63ee768657';

/// Canal one-shot: el recorder emite acá cuando termina la grabación con
/// éxito. El `seq` fuerza cambio de estado aunque el archivo se repita, así
/// `ref.listen` dispara siempre y el process controller no pierde una entrega.

abstract class _$ConsultationRecorderDeliveryNotifier
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
