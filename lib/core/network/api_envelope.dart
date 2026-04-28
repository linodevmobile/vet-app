import 'package:vet_app/core/errors/failures.dart';

/// Desempaqueta el envelope estándar del backend: `{ data, meta, error }`.
///
/// Se usa desde los datasources, después de llamar a `ApiService.get/post/patch`.
/// Si `error != null`, lanza `ApiFailure` con el `message` y `code` del servidor,
/// aunque el HTTP sea 2xx. Si el shape no calza con un `Map`, lanza `UnknownFailure`.
abstract final class ApiEnvelope {
  /// Devuelve el `data` cuando se sabe que es un objeto JSON.
  static Map<String, dynamic> unwrapMap(dynamic raw) {
    final data = _unwrap(raw);
    if (data is! Map<String, dynamic>) {
      throw const UnknownFailure(
        message: 'Respuesta del servidor con formato inesperado.',
      );
    }
    return data;
  }

  /// Devuelve el `data` cuando se sabe que es una colección JSON.
  static List<dynamic> unwrapList(dynamic raw) {
    final data = _unwrap(raw);
    if (data is! List) {
      throw const UnknownFailure(
        message: 'Respuesta del servidor con formato inesperado.',
      );
    }
    return data;
  }

  /// Devuelve el `data` sin tipar — útil cuando el endpoint puede responder
  /// con `null` legítimo (ej. `204`-like).
  static dynamic unwrapDynamic(dynamic raw) => _unwrap(raw);

  static dynamic _unwrap(dynamic raw) {
    if (raw is! Map<String, dynamic>) {
      throw const UnknownFailure(
        message: 'Respuesta del servidor con formato inesperado.',
      );
    }

    final error = raw['error'];
    if (error is Map<String, dynamic>) {
      final message = error['message'] as String? ?? 'Error del servidor.';
      final code = error['code'] as String?;
      throw ApiFailure(message: message, code: code);
    }

    return raw['data'];
  }
}
