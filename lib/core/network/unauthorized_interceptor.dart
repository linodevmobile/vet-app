import 'package:dio/dio.dart';

/// Intercepta 401 del backend (token inválido o expirado) y delega al caller
/// la limpieza de sesión. El error sigue propagándose para que el caller
/// original también reciba el `AuthFailure`.
class UnauthorizedInterceptor extends Interceptor {
  UnauthorizedInterceptor(this._onUnauthorized);

  final Future<void> Function() _onUnauthorized;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _onUnauthorized();
    }
    handler.next(err);
  }
}
