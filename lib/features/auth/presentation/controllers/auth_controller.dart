import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:vet_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';

part 'auth_controller.g.dart';

// Evita flash del splash cuando la sesión resuelve instantánea desde storage local.
const Duration _minSplashDuration = Duration(seconds: 2);

@riverpod
LoginUseCase loginUseCase(Ref ref) =>
    LoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<bool> build() async {
    final results = await Future.wait([
      ref.read(authRepositoryProvider).hasValidSession(),
      Future<void>.delayed(_minSplashDuration),
    ]);
    return results[0] as bool? ?? false;
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    ref.invalidateSelf();
  }
}
