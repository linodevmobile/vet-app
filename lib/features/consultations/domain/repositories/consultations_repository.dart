import 'package:vet_app/features/consultation/domain/entities/in_progress_consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/paused_consultation.dart';
import 'package:vet_app/features/consultations/domain/entities/consultation_record.dart';

abstract interface class IConsultationsRepository {
  Future<List<ConsultationRecord>> fetchRecent({int limit});

  Future<List<PausedConsultation>> fetchPaused();

  Future<List<InProgressConsultation>> fetchInProgress();
}
