import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/consultation/domain/datasources/consultation_datasource.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section_content.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_status.dart';
import 'package:vet_app/features/consultation/infrastructure/api/consultation_api.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_pause_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_response_dto.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_sign_request.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_dto.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_patient_dto.dart';
import 'package:vet_app/features/consultations/infrastructure/models/consultation_section_dto.dart';
import 'package:vet_app/features/patients/domain/entities/patient_summary.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'consultation_datasource_impl.g.dart';

class ConsultationDatasourceImpl implements IConsultationDatasource {
  const ConsultationDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<ConsultationProcessResult> processAudio({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  }) async {
    final form = await ConsultationProcessRequest.fromAudio(
      audio: audio,
      section: section,
      patientId: patientId,
      consultationId: consultationId,
      consultationType: consultationType,
      chiefComplaint: chiefComplaint,
    );
    final raw = await _api.postMultipart(ConsultationApi.process, form);
    final data = ApiEnvelope.unwrapMap(raw);
    return ConsultationProcessResponseDto.fromJson(data).toDomain();
  }

  @override
  Future<void> pauseConsultation({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  }) async {
    final body = ConsultationPauseRequest(
      reason: reason.wireValue,
      note: note,
    ).toJson();
    final raw = await _api.patch(
      ConsultationApi.pause(consultationId),
      body: body,
    );
    ApiEnvelope.unwrapDynamic(raw);
  }

  @override
  Future<void> signConsultation({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  }) async {
    final body = ConsultationSignRequest(
      result: result.wireValue,
      summary: summary,
      primaryDiagnosis: primaryDiagnosis,
    ).toJson();
    final raw = await _api.patch(
      ConsultationApi.sign(consultationId),
      body: body,
    );
    ApiEnvelope.unwrapDynamic(raw);
  }

  @override
  Future<Consultation> getById(String consultationId) async {
    final raw = await _api.get(ConsultationApi.byId(consultationId));
    final data = ApiEnvelope.unwrapMap(raw);
    final dto = ConsultationDto.fromJson(data);
    return _toDomain(dto);
  }

  @override
  Future<void> resumeConsultation(String consultationId) async {
    final raw = await _api.patch(ConsultationApi.resume(consultationId));
    ApiEnvelope.unwrapDynamic(raw);
  }

  // Mapper DTO (compartido con `features/consultations/`) → entidad del dominio.
  // Secciones cuyo wire no matchea el mapping client-side se ignoran (ej. si el
  // backend agrega una nueva antes del release del cliente).
  static Consultation _toDomain(ConsultationDto dto) => Consultation(
        id: dto.id,
        patient: _summary(dto.patient),
        status: ConsultationStatus.fromWire(dto.status),
        createdAt: dto.createdAt,
        sections: dto.sections
            .map(_sectionFromDto)
            .whereType<ConsultationSectionContent>()
            .toList(),
        chiefComplaint: dto.chiefComplaint,
        summary: dto.summary,
        primaryDiagnosis: dto.primaryDiagnosis,
        result:
            dto.result != null ? ConsultationResult.fromWire(dto.result!) : null,
        pauseReason: dto.pauseReason != null
            ? ConsultationPauseReason.fromWire(dto.pauseReason!)
            : null,
        pauseNote: dto.pauseNote,
        pausedAt: dto.pausedAt,
        signedAt: dto.signedAt,
      );

  static ConsultationSectionContent? _sectionFromDto(
    ConsultationSectionDto dto,
  ) {
    final section = ConsultationProcessRequest.sectionForWire(dto.section);
    if (section == null) return null;
    return ConsultationSectionContent(section: section, text: dto.text);
  }

  static PatientSummary _summary(ConsultationPatientDto p) => PatientSummary(
        id: p.id,
        name: p.name,
        species: Species.values.firstWhere(
          (s) => s.name == p.species,
          orElse: () => Species.exotic,
        ),
      );
}

@riverpod
IConsultationDatasource consultationDatasource(Ref ref) =>
    ConsultationDatasourceImpl(ref.watch(apiServiceProvider));
