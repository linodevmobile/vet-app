import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';

part 'consultation_process_response_dto.freezed.dart';
part 'consultation_process_response_dto.g.dart';

@freezed
abstract class ConsultationProcessResponseDto
    with _$ConsultationProcessResponseDto {
  const factory ConsultationProcessResponseDto({
    @JsonKey(name: 'consultation_id') required String consultationId,
    required String section,
    String? transcription,
    @JsonKey(name: 'suggested_text') String? suggestedText,
    @JsonKey(name: 'ai_suggested') Map<String, dynamic>? aiSuggested,
    @JsonKey(name: 'audio_path') String? audioPath,
  }) = _ConsultationProcessResponseDto;

  const ConsultationProcessResponseDto._();

  factory ConsultationProcessResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ConsultationProcessResponseDtoFromJson(json);

  ConsultationProcessResult toDomain() => ConsultationProcessResult(
        consultationId: consultationId,
        section: section,
        suggestedText: suggestedText ?? '',
        transcription: transcription ?? '',
      );
}
