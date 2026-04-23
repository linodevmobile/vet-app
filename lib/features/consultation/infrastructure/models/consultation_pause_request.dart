import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_pause_request.freezed.dart';
part 'consultation_pause_request.g.dart';

@freezed
abstract class ConsultationPauseRequest with _$ConsultationPauseRequest {
  const factory ConsultationPauseRequest({
    required String reason,
    @JsonKey(includeIfNull: false) String? note,
  }) = _ConsultationPauseRequest;

  factory ConsultationPauseRequest.fromJson(Map<String, dynamic> json) =>
      _$ConsultationPauseRequestFromJson(json);
}
