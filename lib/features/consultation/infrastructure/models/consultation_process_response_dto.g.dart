// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_process_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationProcessResponseDto _$ConsultationProcessResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ConsultationProcessResponseDto(
  consultationId: json['consultation_id'] as String,
  section: json['section'] as String,
  transcription: json['transcription'] as String?,
  suggestedText: json['suggested_text'] as String?,
  aiSuggested: json['ai_suggested'] as Map<String, dynamic>?,
  audioPath: json['audio_path'] as String?,
);

Map<String, dynamic> _$ConsultationProcessResponseDtoToJson(
  _ConsultationProcessResponseDto instance,
) => <String, dynamic>{
  'consultation_id': instance.consultationId,
  'section': instance.section,
  'transcription': instance.transcription,
  'suggested_text': instance.suggestedText,
  'ai_suggested': instance.aiSuggested,
  'audio_path': instance.audioPath,
};
