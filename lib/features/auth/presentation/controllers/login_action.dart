import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/auth/presentation/controllers/auth_controller.dart';

part 'login_action.g.dart';

@riverpod
class LoginAction extends _$LoginAction {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> submit({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(loginUseCaseProvider)(email: email, password: password);
    });
    if (!ref.mounted) return;
    if (!state.hasError) {
      ref.invalidate(authControllerProvider);
    }
  }
}
