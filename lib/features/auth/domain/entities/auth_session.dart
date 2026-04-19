import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';

part 'auth_session.freezed.dart';

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required Veterinarian veterinarian,
    required String accessToken,
  }) = _AuthSession;
}
