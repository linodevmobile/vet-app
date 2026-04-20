import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';

part 'hospitalized_patient.freezed.dart';

@freezed
abstract class HospitalizedPatient with _$HospitalizedPatient {
  const factory HospitalizedPatient({
    required String id,
    required PatientSummary patient,
    required int day,
    required String note,
    required List<bool> tasks,
    @Default(false) bool critical,
  }) = _HospitalizedPatient;
}
