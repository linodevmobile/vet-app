// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veterinarian_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VeterinarianDto _$VeterinarianDtoFromJson(Map<String, dynamic> json) =>
    _VeterinarianDto(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      licenseNumber: json['license_number'] as String?,
      phone: json['phone'] as String?,
      salutation: json['salutation'] as String?,
    );

Map<String, dynamic> _$VeterinarianDtoToJson(_VeterinarianDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'license_number': instance.licenseNumber,
      'phone': instance.phone,
      'salutation': instance.salutation,
    };
