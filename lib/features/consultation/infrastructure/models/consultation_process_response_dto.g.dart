// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_process_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationProcessResponseDto _$ConsultationProcessResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ConsultationProcessResponseDto(
  section: json['section'] as String?,
  transcription: json['transcription'] as String?,
  suggestedText: json['suggested_text'] as String?,
  aiSuggested: json['ai_suggested'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ConsultationProcessResponseDtoToJson(
  _ConsultationProcessResponseDto instance,
) => <String, dynamic>{
  'section': instance.section,
  'transcription': instance.transcription,
  'suggested_text': instance.suggestedText,
  'ai_suggested': instance.aiSuggested,
};
