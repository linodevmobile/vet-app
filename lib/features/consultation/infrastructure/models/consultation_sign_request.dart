import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_sign_request.freezed.dart';
part 'consultation_sign_request.g.dart';

@freezed
abstract class ConsultationSignRequest with _$ConsultationSignRequest {
  const factory ConsultationSignRequest({
    required String result,
    @JsonKey(includeIfNull: false) String? summary,
    @JsonKey(name: 'primary_diagnosis', includeIfNull: false)
    String? primaryDiagnosis,
  }) = _ConsultationSignRequest;

  factory ConsultationSignRequest.fromJson(Map<String, dynamic> json) =>
      _$ConsultationSignRequestFromJson(json);
}
