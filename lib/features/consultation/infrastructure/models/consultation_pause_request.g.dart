// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_pause_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationPauseRequest _$ConsultationPauseRequestFromJson(
  Map<String, dynamic> json,
) => _ConsultationPauseRequest(
  reason: json['reason'] as String,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ConsultationPauseRequestToJson(
  _ConsultationPauseRequest instance,
) => <String, dynamic>{'reason': instance.reason, 'note': ?instance.note};
