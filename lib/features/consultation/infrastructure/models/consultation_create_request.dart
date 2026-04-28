abstract final class ConsultationCreateRequest {
  static Map<String, dynamic> build({
    required String patientId,
    String? type,
  }) =>
      {
        'patient_id': patientId,
        if (type != null) 'type': type,
      };
}
