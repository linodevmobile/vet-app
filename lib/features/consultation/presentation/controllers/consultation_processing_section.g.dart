// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_processing_section.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sección cuyo audio está siendo procesado en `/ai/process-section`.
/// Es info paralela al `AsyncValue` del process controller — el AsyncValue
/// expone loading/data/error pero no qué sección, este notifier sí.
/// La View hace `ref.watch` para mostrar feedback inline en el campo correcto.

@ProviderFor(ConsultationProcessingSection)
final consultationProcessingSectionProvider =
    ConsultationProcessingSectionProvider._();

/// Sección cuyo audio está siendo procesado en `/ai/process-section`.
/// Es info paralela al `AsyncValue` del process controller — el AsyncValue
/// expone loading/data/error pero no qué sección, este notifier sí.
/// La View hace `ref.watch` para mostrar feedback inline en el campo correcto.
final class ConsultationProcessingSectionProvider
    extends
        $NotifierProvider<ConsultationProcessingSection, ConsultationSection?> {
  /// Sección cuyo audio está siendo procesado en `/ai/process-section`.
  /// Es info paralela al `AsyncValue` del process controller — el AsyncValue
  /// expone loading/data/error pero no qué sección, este notifier sí.
  /// La View hace `ref.watch` para mostrar feedback inline en el campo correcto.
  ConsultationProcessingSectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationProcessingSectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationProcessingSectionHash();

  @$internal
  @override
  ConsultationProcessingSection create() => ConsultationProcessingSection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConsultationSection? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConsultationSection?>(value),
    );
  }
}

String _$consultationProcessingSectionHash() =>
    r'5bc7eb0539eba6d807dfbe0f37c6f5f28358f4a4';

/// Sección cuyo audio está siendo procesado en `/ai/process-section`.
/// Es info paralela al `AsyncValue` del process controller — el AsyncValue
/// expone loading/data/error pero no qué sección, este notifier sí.
/// La View hace `ref.watch` para mostrar feedback inline en el campo correcto.

abstract class _$ConsultationProcessingSection
    extends $Notifier<ConsultationSection?> {
  ConsultationSection? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ConsultationSection?, ConsultationSection?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConsultationSection?, ConsultationSection?>,
              ConsultationSection?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
