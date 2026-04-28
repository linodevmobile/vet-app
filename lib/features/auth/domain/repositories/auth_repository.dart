import 'package:vet_app/features/auth/domain/entities/auth_session.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';

abstract interface class IAuthRepository {
  Future<AuthSession> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<bool> hasValidSession();

  Future<Veterinarian> getCurrentVeterinarian();
}
