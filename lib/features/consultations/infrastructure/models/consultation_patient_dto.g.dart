// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_patient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationPatientDto _$ConsultationPatientDtoFromJson(
  Map<String, dynamic> json,
) => _ConsultationPatientDto(
  id: json['id'] as String,
  name: json['name'] as String,
  species: json['species'] as String,
);

Map<String, dynamic> _$ConsultationPatientDtoToJson(
  _ConsultationPatientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'species': instance.species,
};
