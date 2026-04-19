// Env.baseUrl queda "" en análisis estático (sin --dart-define) y coincide con
// el default de BaseOptions, lo que produce falso positivo del lint.
// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/core/env/env.dart';
import 'package:vet_app/core/network/auth_interceptor.dart';
import 'package:vet_app/core/storage/secure_storage_service.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(AuthInterceptor(storage));

  if (Env.enableLogs) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }

  return dio;
}
