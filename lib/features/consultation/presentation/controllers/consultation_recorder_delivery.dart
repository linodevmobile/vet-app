import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_recorder_delivery.g.dart';

typedef ConsultationRecorderDelivery = ({
  ConsultationSection section,
  File audio,
  int seq,
});

/// Canal one-shot: el recorder emite acá cuando termina la grabación con
/// éxito. El `seq` fuerza cambio de estado aunque el archivo se repita, así
/// `ref.listen` dispara siempre y el process controller no pierde una entrega.
@riverpod
class ConsultationRecorderDeliveryNotifier
    extends _$ConsultationRecorderDeliveryNotifier {
  int _seq = 0;

  @override
  ConsultationRecorderDelivery? build() => null;

  void emit({
    required ConsultationSection section,
    required File audio,
  }) {
    _seq += 1;
    state = (section: section, audio: audio, seq: _seq);
  }
}
