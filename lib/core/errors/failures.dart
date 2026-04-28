sealed class Failure implements Exception {
  const Failure({required this.message, this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Problema de conexión. Revisa tu red.',
    super.cause,
  });
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'El servidor tardó demasiado en responder.',
    super.cause,
  });
}

final class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Credenciales inválidas o sesión expirada.',
    super.cause,
  });
}

final class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required this.statusCode,
    super.cause,
  });

  final int statusCode;
}

/// Error lógico reportado por el backend en el envelope (`error.code` / `error.message`)
/// con HTTP 2xx. Distinto de `ServerFailure`, que representa fallo de transporte/5xx.
final class ApiFailure extends Failure {
  const ApiFailure({
    required super.message,
    this.code,
    super.cause,
  });

  final String? code;
}

final class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'Ocurrió un error inesperado.',
    super.cause,
  });
}

/// Permiso de micrófono no concedido. `permanent = true` indica que el usuario
/// marcó "no volver a preguntar" (Android) o denegó dos veces (iOS) — en ese
/// caso el prompt nativo ya no aparece y hay que enviarlo a Ajustes.
final class MicPermissionFailure extends Failure {
  const MicPermissionFailure({
    super.message = 'Necesitamos acceso al micrófono para grabar.',
    this.permanent = false,
    super.cause,
  });

  final bool permanent;
}

/// Falla de captura de audio: codec no soportado, storage lleno, device sin
/// micrófono, o error interno del paquete `record`.
final class AudioRecordingFailure extends Failure {
  const AudioRecordingFailure({
    super.message = 'No se pudo grabar audio.',
    super.cause,
  });
}
