import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

typedef CurrentUser = ({
  String fullName,
  String salutation,
  String registry,
});

@riverpod
CurrentUser currentUser(Ref ref) {
  // TODO(auth): leer del AuthSession cuando el API de login esté listo.
  return (
    fullName: 'Andres Mena',
    salutation: 'Dr. Mena',
    registry: 'MV · Reg. 12.845',
  );
}
