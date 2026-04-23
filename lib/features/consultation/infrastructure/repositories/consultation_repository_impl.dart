import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/errors/api_exception_handler.dart';
import 'package:vet_app/features/consultation/domain/datasources/consultation_datasource.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';
import 'package:vet_app/features/consultation/domain/repositories/consultation_repository.dart';
import 'package:vet_app/features/consultation/infrastructure/datasources/consultation_datasource_impl.dart';

part 'consultation_repository_impl.g.dart';

class ConsultationRepositoryImpl implements IConsultationRepository {
  const ConsultationRepositoryImpl(this._datasource);

  final IConsultationDatasource _datasource;

  @override
  Future<ConsultationProcessResult> processAudio({
    required File audio,
    required String section,
    required String patientId,
    String? consultationId,
    String? consultationType,
    String? chiefComplaint,
  }) async {
    try {
      return await _datasource.processAudio(
        audio: audio,
        section: section,
        patientId: patientId,
        consultationId: consultationId,
        consultationType: consultationType,
        chiefComplaint: chiefComplaint,
      );
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }

  @override
  Future<void> pauseConsultation({
    required String consultationId,
    required ConsultationPauseReason reason,
    String? note,
  }) async {
    try {
      await _datasource.pauseConsultation(
        consultationId: consultationId,
        reason: reason,
        note: note,
      );
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }

  @override
  Future<void> signConsultation({
    required String consultationId,
    required ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  }) async {
    try {
      await _datasource.signConsultation(
        consultationId: consultationId,
        result: result,
        summary: summary,
        primaryDiagnosis: primaryDiagnosis,
      );
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }
}

@riverpod
IConsultationRepository consultationRepository(Ref ref) =>
    ConsultationRepositoryImpl(ref.watch(consultationDatasourceProvider));
