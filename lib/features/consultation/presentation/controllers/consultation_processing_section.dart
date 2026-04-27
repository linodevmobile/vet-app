import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_processing_section.g.dart';

/// Sección cuyo audio está siendo procesado en `/ai/process-section`.
/// Es info paralela al `AsyncValue` del process controller — el AsyncValue
/// expone loading/data/error pero no qué sección, este notifier sí.
/// La View hace `ref.watch` para mostrar feedback inline en el campo correcto.
@riverpod
class ConsultationProcessingSection extends _$ConsultationProcessingSection {
  @override
  ConsultationSection? build() => null;

  void start(ConsultationSection section) => state = section;
  void clear() => state = null;
}
