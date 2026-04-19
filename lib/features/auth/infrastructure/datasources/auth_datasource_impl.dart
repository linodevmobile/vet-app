import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/network/api_service.dart';
import 'package:vet_app/features/auth/domain/datasources/auth_datasource.dart';
import 'package:vet_app/features/auth/domain/entities/auth_session.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';
import 'package:vet_app/features/auth/infrastructure/api/auth_api.dart';
import 'package:vet_app/features/auth/infrastructure/models/auth_response_dto.dart';

part 'auth_datasource_impl.g.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  const AuthDatasourceImpl(this._api);

  final ApiService _api;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final data = await _api.post(
      AuthApi.login,
      body: {'email': email, 'password': password},
    );
    final dto = AuthResponseDto.fromJson(data as Map<String, dynamic>);
    return _toEntity(dto);
  }

  AuthSession _toEntity(AuthResponseDto dto) => AuthSession(
        veterinarian: Veterinarian(
          id: dto.veterinarian.id,
          email: dto.veterinarian.email,
          fullName: dto.veterinarian.fullName,
          licenseNumber: dto.veterinarian.licenseNumber,
          phone: dto.veterinarian.phone,
        ),
        accessToken: dto.session.accessToken,
      );
}

@riverpod
IAuthDatasource authDatasource(Ref ref) =>
    AuthDatasourceImpl(ref.watch(apiServiceProvider));
