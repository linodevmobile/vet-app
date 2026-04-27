import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_process_result.freezed.dart';

@freezed
abstract class ConsultationProcessResult with _$ConsultationProcessResult {
  const factory ConsultationProcessResult({
    required String suggestedText,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
  }) = _ConsultationProcessResult;
}
