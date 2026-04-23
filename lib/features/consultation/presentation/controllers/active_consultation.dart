import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_consultation.g.dart';

/// Guarda el `consultation_id` devuelto por la primera llamada a
/// `/consultation/process` (la de anamnesis). Las llamadas siguientes del
/// mismo flujo deben reenviarlo para que el backend amarre las secciones.
@riverpod
class ActiveConsultation extends _$ActiveConsultation {
  @override
  String? build() => null;

  void setId(String id) => state = id;

  void clear() => state = null;
}
