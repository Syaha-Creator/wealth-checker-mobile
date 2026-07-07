import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_interceptor.dart';

part 'api_client.g.dart';

const _defaultApiBaseUrl = 'https://wealth.velrox.cloud';
const _requestTimeout = Duration(seconds: 15);

@Riverpod(keepAlive: true)
Dio apiClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: _defaultApiBaseUrl,
      ),
      connectTimeout: _requestTimeout,
      receiveTimeout: _requestTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(AuthInterceptor(ref));

  return dio;
}
