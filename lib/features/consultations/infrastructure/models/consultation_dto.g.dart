// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationDto _$ConsultationDtoFromJson(Map<String, dynamic> json) =>
    _ConsultationDto(
      id: json['id'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      patient: ConsultationPatientDto.fromJson(
        json['patient'] as Map<String, dynamic>,
      ),
      type: json['type'] as String?,
      chiefComplaint: json['chief_complaint'] as String?,
      result: json['result'] as String?,
      summary: json['summary'] as String?,
      primaryDiagnosis: json['primary_diagnosis'] as String?,
      pausedReason: json['paused_reason'] as String?,
      pausedNote: json['paused_note'] as String?,
      pausedAt: json['paused_at'] == null
          ? null
          : DateTime.parse(json['paused_at'] as String),
      signedAt: json['signed_at'] == null
          ? null
          : DateTime.parse(json['signed_at'] as String),
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ConsultationSectionDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ConsultationSectionDto>[],
    );

Map<String, dynamic> _$ConsultationDtoToJson(_ConsultationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'patient': instance.patient.toJson(),
      'type': instance.type,
      'chief_complaint': instance.chiefComplaint,
      'result': instance.result,
      'summary': instance.summary,
      'primary_diagnosis': instance.primaryDiagnosis,
      'paused_reason': instance.pausedReason,
      'paused_note': instance.pausedNote,
      'paused_at': instance.pausedAt?.toIso8601String(),
      'signed_at': instance.signedAt?.toIso8601String(),
      'sections': instance.sections.map((e) => e.toJson()).toList(),
    };
