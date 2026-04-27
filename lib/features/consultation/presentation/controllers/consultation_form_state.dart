import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_form_state.freezed.dart';

@freezed
abstract class ConsultationFormState with _$ConsultationFormState {
  const factory ConsultationFormState({
    String? food,
    String? mucosa,
    String? bcs,
    String? attitudeOwner,
    String? attitudeVet,
    String? pulse,
    String? treatment,
    @Default(0) double dehydration,
  }) = _ConsultationFormState;
}
