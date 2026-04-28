import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_progress_consultation.freezed.dart';

@freezed
abstract class InProgressConsultation with _$InProgressConsultation {
  const factory InProgressConsultation({
    required String id,
    required String patientId,
    required DateTime createdAt,
  }) = _InProgressConsultation;
}
