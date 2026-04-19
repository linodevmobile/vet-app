import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'patient_summary.freezed.dart';

@freezed
abstract class PatientSummary with _$PatientSummary {
  const factory PatientSummary({
    required String id,
    required String name,
    required Species species,
  }) = _PatientSummary;
}
