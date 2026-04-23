import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_recorder_result.g.dart';

typedef ConsultationRecorderDelivery = ({
  ConsultationSection section,
  ConsultationProcessResult result,
  int seq,
});

/// Canal one-shot: el recorder controller emite acá cuando termina un upload
/// con éxito. El `seq` fuerza el cambio de estado aunque `result` sea idéntico
/// al previo, así `ref.listen` dispara en la view cada vez.
@riverpod
class ConsultationRecorderResult extends _$ConsultationRecorderResult {
  int _seq = 0;

  @override
  ConsultationRecorderDelivery? build() => null;

  void emit({
    required ConsultationSection section,
    required ConsultationProcessResult result,
  }) {
    _seq += 1;
    state = (section: section, result: result, seq: _seq);
  }
}
