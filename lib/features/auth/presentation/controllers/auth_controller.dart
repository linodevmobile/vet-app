import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:vet_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';

part 'auth_controller.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) =>
    LoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<bool> build() =>
      ref.read(authRepositoryProvider).hasValidSession();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      await ref.read(loginUseCaseProvider)(email: email, password: password);
      return true;
    });
    if (!ref.mounted) return;
    state = result;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).logout();
      return false;
    });
    if (!ref.mounted) return;
    state = result;
  }
}
