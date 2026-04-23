// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_section_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationSectionDto _$ConsultationSectionDtoFromJson(
  Map<String, dynamic> json,
) => _ConsultationSectionDto(
  section: json['section'] as String,
  text: json['text'] as String?,
  aiSuggested: json['ai_suggested'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ConsultationSectionDtoToJson(
  _ConsultationSectionDto instance,
) => <String, dynamic>{
  'section': instance.section,
  'text': instance.text,
  'ai_suggested': instance.aiSuggested,
};
