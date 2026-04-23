import 'dart:io';

import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';

abstract interface class IConsultationDatasource {
  Future<ConsultationProcessResult> processAudio({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  });
}
