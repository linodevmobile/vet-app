import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

part 'all_patients.g.dart';

@riverpod
List<Patient> allPatients(Ref ref) {
  // TODO(api): reemplazar por fetch real al endpoint de pacientes.
  final now = DateTime.now();
  DateTime daysAgo(int d, {int hours = 0}) =>
      now.subtract(Duration(days: d, hours: hours));

  return [
    Patient(
      id: 'p-luna',
      name: 'Luna Martínez',
      species: Species.dog,
      breed: 'Golden Retriever',
      ageYears: 4,
      ownerName: 'Ana Martínez',
      lastVisit: daysAgo(8),
    ),
    Patient(
      id: 'p-thor',
      name: 'Thor Smith',
      species: Species.dog,
      breed: 'Labrador',
      ageYears: 7,
      ownerName: 'Julian Smith',
      lastVisit: daysAgo(0, hours: 2),
      isAlert: true,
    ),
    Patient(
      id: 'p-mochi',
      name: 'Mochi Herrera',
      species: Species.cat,
      breed: 'Maine Coon',
      ageYears: 2,
      ownerName: 'Sofía Herrera',
      lastVisit: daysAgo(90),
    ),
    Patient(
      id: 'p-kira',
      name: 'Kira Vargas',
      species: Species.dog,
      breed: 'Pastor Alemán',
      ageYears: 9,
      ownerName: 'Diego Vargas',
      lastVisit: now,
      isAlert: true,
      isHospitalized: true,
    ),
    Patient(
      id: 'p-simon',
      name: 'Simón López',
      species: Species.cat,
      breed: 'Común Europeo',
      ageYears: 3,
      ownerName: 'Paula López',
      lastVisit: daysAgo(1),
      isHospitalized: true,
    ),
    Patient(
      id: 'p-milo',
      name: 'Milo Ortiz',
      species: Species.exotic,
      breed: 'Holland Lop',
      ageYears: 1,
      ownerName: 'Lucía Ortiz',
      lastVisit: daysAgo(180),
    ),
    Patient(
      id: 'p-bruno',
      name: 'Bruno Valdés',
      species: Species.dog,
      breed: 'Bulldog Francés',
      ageYears: 5,
      ownerName: 'Carlos Valdés',
      lastVisit: daysAgo(14),
    ),
    Patient(
      id: 'p-max',
      name: 'Max Mendoza',
      species: Species.dog,
      breed: 'Beagle',
      ageYears: 6,
      ownerName: 'Carlos Mendoza',
      lastVisit: daysAgo(1),
    ),
  ];
}
