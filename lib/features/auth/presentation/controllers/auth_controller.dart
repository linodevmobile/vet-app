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
    final session = ref.read(authRepositoryProvider).hasValidSession();
    await Future.wait([
      session,
      Future<void>.delayed(_minSplashDuration),
    ]);
    return session;
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(false);
  }

  // Salida lateral del flujo: tras un login exitoso, el repository ya guardó el
  // token. Setear state evita re-ejecutar build() y pagar el _minSplashDuration.
  void markAuthenticated() => state = const AsyncData(true);
}
