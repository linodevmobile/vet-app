import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/consultation/domain/datasources/consultation_datasource.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section_content.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_status.dart';
import 'package:vet_app/features/consultation/infrastructure/api/consultation_api.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_create_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_pause_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_response_dto.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_section_wire.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_sign_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/process_section_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/sync_section_request.dart';
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
  Future<String> createConsultation({
    required String patientId,
    String? type,
  }) async {
    final body = ConsultationCreateRequest.build(
      patientId: patientId,
      type: type,
    );
    final raw = await _api.post(ConsultationApi.collection, body: body);
    final data = ApiEnvelope.unwrapMap(raw);
    return data['id'] as String;
  }

  @override
  Future<ConsultationProcessResult> processSection({
    required ConsultationSection section,
    File? audio,
    String? textInput,
  }) async {
    final wire = ConsultationSectionWire.wireFor(section);
    if (wire == null) {
      throw ArgumentError('Section ${section.name} is not API-backed.');
    }
    final form = await ProcessSectionRequest.build(
      section: wire,
      audio: audio,
      textInput: textInput,
    );
    final raw = await _api.postMultipart(ConsultationApi.aiProcessSection, form);
    final data = ApiEnvelope.unwrapMap(raw);
    return ConsultationProcessResponseDto.fromJson(data).toDomain();
  }

  @override
  Future<void> syncSection({
    required String consultationId,
    required ConsultationSection section,
    String? text,
    Map<String, dynamic>? content,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
    File? audio,
  }) async {
    final wire = ConsultationSectionWire.wireFor(section);
    if (wire == null) {
      throw ArgumentError('Section ${section.name} is not API-backed.');
    }
    final form = await SyncSectionRequest.build(
      text: text,
      content: content,
      transcription: transcription,
      aiSuggested: aiSuggested,
      audio: audio,
    );
    final raw = await _api.patchMultipart(
      ConsultationApi.section(consultationId, wire),
      form,
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
  Future<void> resumeConsultation(String consultationId) async {
    final raw = await _api.patch(ConsultationApi.resume(consultationId));
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

  // Mapper DTO → entidad de dominio. Las secciones cuyo wire no matchea el
  // mapping client-side se ignoran: si el backend agrega una nueva antes del
  // release del cliente, no rompe el parseo.
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
    final section = ConsultationSectionWire.sectionForWire(dto.section);
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
