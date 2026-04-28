import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/usecases/get_consultation_by_id_usecase.dart';
import 'package:vet_app/features/consultation/infrastructure/repositories/consultation_repository_impl.dart';

part 'consultation_detail_controller.g.dart';

@riverpod
GetConsultationByIdUseCase getConsultationByIdUseCase(Ref ref) =>
    GetConsultationByIdUseCase(ref.watch(consultationRepositoryProvider));

@riverpod
class ConsultationDetailController extends _$ConsultationDetailController {
  @override
  Future<Consultation> build(String consultationId) =>
      ref.read(getConsultationByIdUseCaseProvider)(consultationId);
}
