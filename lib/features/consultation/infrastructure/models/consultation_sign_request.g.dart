// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_sign_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationSignRequest _$ConsultationSignRequestFromJson(
  Map<String, dynamic> json,
) => _ConsultationSignRequest(
  result: json['result'] as String,
  summary: json['summary'] as String?,
  primaryDiagnosis: json['primary_diagnosis'] as String?,
);

Map<String, dynamic> _$ConsultationSignRequestToJson(
  _ConsultationSignRequest instance,
) => <String, dynamic>{
  'result': instance.result,
  'summary': ?instance.summary,
  'primary_diagnosis': ?instance.primaryDiagnosis,
};
