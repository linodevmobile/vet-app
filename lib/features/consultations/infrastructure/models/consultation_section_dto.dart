import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_section_dto.freezed.dart';
part 'consultation_section_dto.g.dart';

@freezed
abstract class ConsultationSectionDto with _$ConsultationSectionDto {
  const factory ConsultationSectionDto({
    required String section,
    String? text,
    Map<String, dynamic>? content,
    Map<String, dynamic>? aiSuggested,
  }) = _ConsultationSectionDto;

  factory ConsultationSectionDto.fromJson(Map<String, dynamic> json) =>
      _$ConsultationSectionDtoFromJson(json);
}
