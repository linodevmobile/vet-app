import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/in_progress_consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/consultations/domain/datasources/consultations_datasource.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_type.dart';
import 'package:vet_app/features/consultations/infrastructure/api/consultations_api.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_dto.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_patient_dto.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_section_dto.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'consultations_datasource_impl.g.dart';

// Total fijo del flujo `POST /consultation/process`. Si el backend cambia la
// cantidad, toca subir esto (y la UI de progreso) en sincronía.
const _totalSections = 9;

class ConsultationsDatasourceImpl implements IConsultationsDatasource {
  const ConsultationsDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<List<ConsultationRecord>> fetchRecent({int limit = 4}) async {
    final raw = await _api.get(
      ConsultationsApi.recent,
      queryParameters: {'limit': limit},
    );
    final data = ApiEnvelope.unwrapList(raw);
    return data
        .map((e) => ConsultationDto.fromJson(e as Map<String, dynamic>))
        .map(_toRecord)
        .toList();
  }

  @override
  Future<List<PausedConsultation>> fetchPaused() async =>
      (await _fetchByStatus('paused')).map(_toPaused).toList();

  @override
  Future<List<InProgressConsultation>> fetchInProgress() async =>
      (await _fetchByStatus('in_progress')).map(_toInProgress).toList();

  Future<List<ConsultationDto>> _fetchByStatus(String status) async {
    final raw = await _api.get(
      ConsultationsApi.base,
      queryParameters: {'status': status},
    );
    return ApiEnvelope.unwrapList(raw)
        .map((e) => ConsultationDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // `summary` lo llena el vet al firmar; si lo dejó vacío, caemos al diagnóstico
  // principal antes que mostrar una tarjeta sin contexto en el dashboard.
  static ConsultationRecord _toRecord(ConsultationDto dto) =>
      ConsultationRecord(
        id: dto.id,
        patient: _summary(dto.patient),
        summary: dto.summary ?? dto.primaryDiagnosis ?? '',
        performedAt: dto.signedAt ?? dto.createdAt,
        type: _parseType(dto.type),
      );

  // `paused_at` puede venir ausente en respuestas antiguas; `createdAt` evita
  // el crash y mantiene el orden cronológico aproximado en la lista.
  static PausedConsultation _toPaused(ConsultationDto dto) =>
      PausedConsultation(
        id: dto.id,
        patient: _summary(dto.patient),
        reason: dto.pauseReason != null
            ? ConsultationPauseReason.fromWire(dto.pauseReason!)
            : ConsultationPauseReason.other,
        note: dto.pauseNote,
        pausedAt: dto.pausedAt ?? dto.createdAt,
        sectionsCompleted: _countCompleted(dto.sections),
        sectionsTotal: _totalSections,
      );

  static InProgressConsultation _toInProgress(ConsultationDto dto) =>
      InProgressConsultation(
        id: dto.id,
        patientId: dto.patient.id,
        createdAt: dto.createdAt,
      );

  // `text` viene cuando el vet editó manualmente; `ai_suggested` cuando solo
  // quedó la sugerencia del modelo. Cualquiera de los dos cuenta como avance.
  static int _countCompleted(List<ConsultationSectionDto> sections) => sections
      .where(
        (s) => (s.text != null && s.text!.isNotEmpty) || s.aiSuggested != null,
      )
      .length;

  static PatientSummary _summary(ConsultationPatientDto p) => PatientSummary(
        id: p.id,
        name: p.name,
        species: _parseSpecies(p.species),
      );

  // `orElse` evita que un enum nuevo del backend (ej. nueva especie agregada
  // antes de release del cliente) reviente la lista entera de consultas.
  static Species _parseSpecies(String raw) => Species.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => Species.exotic,
      );

  static ConsultationType _parseType(String? raw) => raw == null
      ? ConsultationType.routine
      : ConsultationType.values.firstWhere(
          (t) => t.name == raw,
          orElse: () => ConsultationType.routine,
        );
}

@riverpod
IConsultationsDatasource consultationsDatasource(Ref ref) =>
    ConsultationsDatasourceImpl(ref.watch(apiServiceProvider));
