import 'package:vet_app/features/auth/domain/entities/auth_session.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';

abstract interface class IAuthDatasource {
  Future<AuthSession> login({
    required String email,
    required String password,
  });

  Future<Veterinarian> fetchMe();
}
