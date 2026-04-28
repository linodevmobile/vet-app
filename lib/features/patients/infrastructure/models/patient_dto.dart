import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_dto.freezed.dart';
part 'patient_dto.g.dart';

// snake_case global viene de build.yaml (field_rename: snake).
@freezed
abstract class PatientDto with _$PatientDto {
  const factory PatientDto({
    required String id,
    required String name,
    required String species,
    required String sex,
    required String ownerName,
    required DateTime createdAt,
    String? breed,
    int? ageYears,
    DateTime? dateOfBirth,
    double? weightKg,
    String? microchip,
    String? ownerPhone,
    String? ownerEmail,
    String? veterinarianId,
  }) = _PatientDto;

  factory PatientDto.fromJson(Map<String, dynamic> json) =>
      _$PatientDtoFromJson(json);
}
