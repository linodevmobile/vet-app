import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

part 'consultation_section_content.freezed.dart';

@freezed
abstract class ConsultationSectionContent with _$ConsultationSectionContent {
  const factory ConsultationSectionContent({
    required ConsultationSection section,
    String? text,
  }) = _ConsultationSectionContent;
}
