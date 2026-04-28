import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'patient.freezed.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required Species species,
    required Sex sex,
    required String breed,
    required int ageYears,
    required String ownerName,
    // Mientras el backend no exponga `last_visit_at`, los datasources lo
    // alimentan con `created_at` para que la UI siga funcionando.
    required DateTime lastVisit,
    double? weightKg,
    String? ownerPhone,
    String? ownerEmail,
    @Default(false) bool isAlert,
    @Default(false) bool isHospitalized,
  }) = _Patient;
}
