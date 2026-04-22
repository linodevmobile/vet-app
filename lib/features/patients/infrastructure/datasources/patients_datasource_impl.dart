import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/patients/domain/datasources/patients_datasource.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';
import 'package:vet_app/features/patients/infrastructure/api/patients_api.dart';
import 'package:vet_app/features/patients/infrastructure/models/create_patient_request_dto.dart';
import 'package:vet_app/features/patients/infrastructure/models/patient_dto.dart';

part 'patients_datasource_impl.g.dart';

class PatientsDatasourceImpl implements IPatientsDatasource {
  const PatientsDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<List<Patient>> list({
    PatientFilter filter = PatientFilter.all,
    String? search,
    int limit = 50,
    int offset = 0,
  }) async {
    final raw = await _api.get(
      PatientsApi.base,
      queryParameters: {
        if (_backendFilter(filter) != null) 'filter': _backendFilter(filter),
        if (search != null && search.isNotEmpty) 'search': search,
        'limit': limit,
        'offset': offset,
      },
    );
    final data = ApiEnvelope.unwrapList(raw);
    return data
        .map((e) => PatientDto.fromJson(e as Map<String, dynamic>))
        .map(_toEntity)
        .toList();
  }

  @override
  Future<Patient> create(Patient draft) async {
    final body = CreatePatientRequestDto(
      name: draft.name,
      species: draft.species.name,
      sex: draft.sex.name,
      ownerName: draft.ownerName,
      breed: draft.breed.isEmpty ? null : draft.breed,
      ageYears: draft.ageYears,
      weightKg: draft.weightKg,
      ownerPhone: draft.ownerPhone,
      ownerEmail: draft.ownerEmail,
    ).toJson()
      ..removeWhere((_, v) => v == null);
    final raw = await _api.post(PatientsApi.base, body: body);
    final data = ApiEnvelope.unwrapMap(raw);
    return _toEntity(PatientDto.fromJson(data));
  }

  // Hospitalized no tiene mapeo backend todavía → se devuelve `all` y se
  // filtra client-side sobre `is_hospitalized` (aún ausente en response).
  static String? _backendFilter(PatientFilter f) => switch (f) {
        PatientFilter.all || PatientFilter.hospitalized => 'all',
        PatientFilter.todayAgenda => 'today_agenda',
        PatientFilter.favorites => 'favorites',
        PatientFilter.recent => 'recent',
      };

  static Patient _toEntity(PatientDto dto) => Patient(
        id: dto.id,
        name: dto.name,
        species: _parseSpecies(dto.species),
        sex: _parseSex(dto.sex),
        breed: dto.breed ?? '',
        ageYears: dto.ageYears ?? _ageFromDob(dto.dateOfBirth),
        ownerName: dto.ownerName,
        // Placeholder: backend aún no expone `last_visit_at` en list/detail.
        lastVisit: dto.createdAt,
        weightKg: dto.weightKg,
        ownerPhone: dto.ownerPhone,
        ownerEmail: dto.ownerEmail,
      );

  static Species _parseSpecies(String raw) => Species.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => Species.exotic,
      );

  static Sex _parseSex(String raw) => Sex.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => Sex.male,
      );

  static int _ageFromDob(DateTime? dob) {
    if (dob == null) return 0;
    final now = DateTime.now();
    var age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age -= 1;
    }
    return age < 0 ? 0 : age;
  }
}

@riverpod
IPatientsDatasource patientsDatasource(Ref ref) =>
    PatientsDatasourceImpl(ref.watch(apiServiceProvider));
