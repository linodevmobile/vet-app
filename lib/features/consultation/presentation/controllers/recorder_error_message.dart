import 'package:vet_app/core/errors/failures.dart';

/// Mapa `Failure` → mensaje corto para el toast. Mantiene la vista sin ifs
/// sobre tipos concretos de falla.
String recorderErrorMessage(Object error) {
  if (error is MicPermissionFailure) {
    return error.permanent
        ? 'Activa el micrófono en Ajustes.'
        : 'Permiso de micrófono denegado.';
  }
  if (error is Failure) return error.message;
  return 'Ocurrió un error inesperado.';
}
