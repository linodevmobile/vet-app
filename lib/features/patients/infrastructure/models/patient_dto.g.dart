// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientDto _$PatientDtoFromJson(Map<String, dynamic> json) => _PatientDto(
  id: json['id'] as String,
  name: json['name'] as String,
  species: json['species'] as String,
  sex: json['sex'] as String,
  ownerName: json['owner_name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  breed: json['breed'] as String?,
  ageYears: (json['age_years'] as num?)?.toInt(),
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
  weightKg: (json['weight_kg'] as num?)?.toDouble(),
  microchip: json['microchip'] as String?,
  ownerPhone: json['owner_phone'] as String?,
  ownerEmail: json['owner_email'] as String?,
  veterinarianId: json['veterinarian_id'] as String?,
);

Map<String, dynamic> _$PatientDtoToJson(_PatientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'sex': instance.sex,
      'owner_name': instance.ownerName,
      'created_at': instance.createdAt.toIso8601String(),
      'breed': instance.breed,
      'age_years': instance.ageYears,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'weight_kg': instance.weightKg,
      'microchip': instance.microchip,
      'owner_phone': instance.ownerPhone,
      'owner_email': instance.ownerEmail,
      'veterinarian_id': instance.veterinarianId,
    };
