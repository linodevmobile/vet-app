import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'species_selection_controller.g.dart';

@riverpod
class SpeciesSelectionController extends _$SpeciesSelectionController {
  @override
  Species build() => Species.dog;

  void select(Species species) => state = species;
}
