import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'patient.freezed.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required Species species,
    required String breed,
    required int ageYears,
    required String ownerName,
    required DateTime lastVisit,
    @Default(false) bool isAlert,
    @Default(false) bool isHospitalized,
  }) = _Patient;
}
