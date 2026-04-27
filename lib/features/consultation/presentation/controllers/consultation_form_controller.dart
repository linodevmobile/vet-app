import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_state.dart';

part 'consultation_form_controller.g.dart';

@riverpod
class ConsultationFormController extends _$ConsultationFormController {
  @override
  ConsultationFormState build(String consultationId) =>
      const ConsultationFormState();

  void setFood(String value) => state = state.copyWith(food: value);
  void setMucosa(String value) => state = state.copyWith(mucosa: value);
  void setBcs(String value) => state = state.copyWith(bcs: value);
  void setAttitudeOwner(String value) =>
      state = state.copyWith(attitudeOwner: value);
  void setAttitudeVet(String value) =>
      state = state.copyWith(attitudeVet: value);
  void setPulse(String value) => state = state.copyWith(pulse: value);
  void setTreatment(String value) => state = state.copyWith(treatment: value);
  void setDehydration(double value) =>
      state = state.copyWith(dehydration: value);
}
