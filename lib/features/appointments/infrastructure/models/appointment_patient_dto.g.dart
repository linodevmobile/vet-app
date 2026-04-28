// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_patient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentPatientDto _$AppointmentPatientDtoFromJson(
  Map<String, dynamic> json,
) => _AppointmentPatientDto(
  id: json['id'] as String,
  name: json['name'] as String,
  species: json['species'] as String,
);

Map<String, dynamic> _$AppointmentPatientDtoToJson(
  _AppointmentPatientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'species': instance.species,
};
