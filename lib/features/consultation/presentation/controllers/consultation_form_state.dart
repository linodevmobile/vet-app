import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_form_state.freezed.dart';

@freezed
abstract class ConsultationFormState with _$ConsultationFormState {
  const factory ConsultationFormState({
    String? food,
    String? temperatureC,
    String? heartRateBpm,
    String? respiratoryRateRpm,
    String? weightKg,
    String? mucosa,
    String? bcs,
    String? attitudeOwner,
    String? attitudeVet,
    String? pulse,
    String? tllcSeconds,
    String? trcpSeconds,
    String? systemsAffected,
    String? treatment,
    @Default(0) double dehydration,
    @Default(<ConsultationSection, String>{})
    Map<ConsultationSection, String> texts,
  }) = _ConsultationFormState;
}
