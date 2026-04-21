import 'package:vet_app/features/patients/domain/entities/species.dart';

abstract final class SpeciesFormatters {
  static String label(Species species) => switch (species) {
        Species.dog => 'Perro',
        Species.cat => 'Gato',
        Species.exotic => 'Exótico',
      };
}
