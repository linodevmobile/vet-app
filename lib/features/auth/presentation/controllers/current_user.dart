import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';
import 'package:vet_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';

part 'current_user.g.dart';

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  Future<Veterinarian> build() =>
      ref.watch(authRepositoryProvider).getCurrentVeterinarian();
}
