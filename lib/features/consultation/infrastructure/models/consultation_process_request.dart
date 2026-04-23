import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

/// Adapta parámetros de dominio al multipart esperado por
/// `POST /consultation/process`. Solo infraestructura — el dominio no conoce
/// `FormData` ni los nombres de campo del backend.
abstract final class ConsultationProcessRequest {
  /// `identification` y `signature` no se mandan al endpoint (son cliente puro);
  /// por eso el map los omite y `wireFor` devuelve null para ellos.
  static const Map<ConsultationSection, String> _wire = {
    ConsultationSection.anamnesis: 'anamnesis',
    ConsultationSection.exam: 'examen_fisico',
    ConsultationSection.problems: 'problemas',
    ConsultationSection.differential: 'abordaje_diagnostico',
    ConsultationSection.labs: 'examenes_complementarios',
    ConsultationSection.diagnosis: 'diagnostico_presuntivo',
    ConsultationSection.plan: 'plan_terapeutico',
    ConsultationSection.prognosis: 'pronostico_evolucion',
  };

  static String? wireFor(ConsultationSection section) => _wire[section];

  static ConsultationSection? sectionForWire(String wire) {
    for (final entry in _wire.entries) {
      if (entry.value == wire) return entry.key;
    }
    return null;
  }

  static Future<FormData> fromAudio({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  }) async {
    return FormData.fromMap({
      'audio': await MultipartFile.fromFile(
        audio.path,
        filename: audio.uri.pathSegments.last,
      ),
      'section': section,
      'patient_id': patientId,
      if (consultationId != null) 'consultation_id': consultationId,
      if (consultationType != null) 'consultation_type': consultationType,
      if (chiefComplaint != null) 'chief_complaint': chiefComplaint,
    });
  }
}
