import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/consultation/domain/datasources/consultation_datasource.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_process_result.dart';
import 'package:vet_app/features/consultation/infrastructure/api/consultation_api.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_request.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_process_response_dto.dart';

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
}

@riverpod
IConsultationDatasource consultationDatasource(Ref ref) =>
    ConsultationDatasourceImpl(ref.watch(apiServiceProvider));
