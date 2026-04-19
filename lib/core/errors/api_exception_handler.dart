import 'package:dio/dio.dart';
import 'package:vet_app/core/errors/failures.dart';

abstract final class ApiExceptionHandler {
  static Failure handle(Object error) {
    if (error is Failure) return error;
    if (error is DioException) return _fromDio(error);
    return UnknownFailure(cause: error);
  }

  static Failure _fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutFailure(cause: e);

      case DioExceptionType.connectionError:
        return NetworkFailure(cause: e);

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 0;
        if (status == 401 || status == 403) {
          return AuthFailure(cause: e);
        }
        return ServerFailure(
          message: _extractMessage(e.response?.data) ??
              e.response?.statusMessage ??
              'Error del servidor.',
          statusCode: status,
          cause: e,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return UnknownFailure(cause: e);
    }
  }

  static String? _extractMessage(Object? data) {
    if (data is Map<String, dynamic>) {
      final m = data['message'] ?? data['error'] ?? data['detail'];
      if (m is String && m.isNotEmpty) return m;
    }
    return null;
  }
}
