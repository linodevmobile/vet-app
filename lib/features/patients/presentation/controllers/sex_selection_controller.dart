import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';

part 'sex_selection_controller.g.dart';

@riverpod
class SexSelectionController extends _$SexSelectionController {
  @override
  Sex build() => Sex.male;

  void select(Sex sex) => state = sex;
}
