import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/errors/api_exception_handler.dart';
import 'package:vet_app/features/consultation/domain/entities/in_progress_consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/consultations/domain/datasources/consultations_datasource.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';
import 'package:vet_app/features/consultations/domain/repositories/consultations_repository.dart';
import 'package:vet_app/features/consultations/infrastructure/datasources/consultations_datasource_impl.dart';

part 'consultations_repository_impl.g.dart';

class ConsultationsRepositoryImpl implements IConsultationsRepository {
  const ConsultationsRepositoryImpl(this._datasource);

  final IConsultationsDatasource _datasource;

  @override
  Future<List<ConsultationRecord>> fetchRecent({int limit = 4}) async {
    try {
      return await _datasource.fetchRecent(limit: limit);
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }

  @override
  Future<List<PausedConsultation>> fetchPaused() async {
    try {
      return await _datasource.fetchPaused();
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }

  @override
  Future<List<InProgressConsultation>> fetchInProgress() async {
    try {
      return await _datasource.fetchInProgress();
    } catch (e) {
      throw ApiExceptionHandler.handle(e);
    }
  }
}

@riverpod
IConsultationsRepository consultationsRepository(Ref ref) =>
    ConsultationsRepositoryImpl(ref.watch(consultationsDatasourceProvider));
