import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_envelope.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/auth/domain/datasources/auth_datasource.dart';
import 'package:vet_app/features/auth/domain/entities/auth_session.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';
import 'package:vet_app/features/auth/infrastructure/api/auth_api.dart';
import 'package:vet_app/features/auth/infrastructure/models/auth_response_dto.dart';
import 'package:vet_app/features/auth/infrastructure/models/veterinarian_dto.dart';

part 'auth_datasource_impl.g.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  const AuthDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final raw = await _api.post(
      AuthApi.login,
      body: {'email': email, 'password': password},
    );
    final data = ApiEnvelope.unwrapMap(raw);
    final dto = AuthResponseDto.fromJson(data);
    return _toEntity(dto);
  }

  @override
  Future<Veterinarian> fetchMe() async {
    final raw = await _api.get(AuthApi.me);
    final data = ApiEnvelope.unwrapMap(raw);
    final dto = VeterinarianDto.fromJson(data);
    return _dtoToVet(dto);
  }

  AuthSession _toEntity(AuthResponseDto dto) => AuthSession(
        veterinarian: _dtoToVet(dto.veterinarian),
        accessToken: dto.session.accessToken,
      );

  Veterinarian _dtoToVet(VeterinarianDto dto) => Veterinarian(
        id: dto.id,
        email: dto.email,
        fullName: dto.fullName,
        licenseNumber: dto.licenseNumber,
        phone: dto.phone,
        salutation: dto.salutation,
      );
}

@riverpod
IAuthDatasource authDatasource(Ref ref) =>
    AuthDatasourceImpl(ref.watch(apiServiceProvider));
