import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_patient_request_dto.freezed.dart';
part 'create_patient_request_dto.g.dart';

// Body del POST /patients. `dateOfBirth` O `ageYears` son mutuamente
// excluyentes; el backend acepta cualquiera de los dos.
@freezed
abstract class CreatePatientRequestDto with _$CreatePatientRequestDto {
  const factory CreatePatientRequestDto({
    required String name,
    required String species,
    required String sex,
    required String ownerName,
    String? breed,
    int? ageYears,
    DateTime? dateOfBirth,
    double? weightKg,
    String? microchip,
    String? ownerPhone,
    String? ownerEmail,
  }) = _CreatePatientRequestDto;

  factory CreatePatientRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePatientRequestDtoFromJson(json);
}
