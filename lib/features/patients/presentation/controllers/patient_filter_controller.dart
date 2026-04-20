import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';

part 'patient_filter_controller.g.dart';

@riverpod
class PatientFilterController extends _$PatientFilterController {
  @override
  PatientFilter build() => PatientFilter.all;

  void select(PatientFilter filter) => state = filter;
}
