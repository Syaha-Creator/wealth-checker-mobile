import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/health_checkup.dart';

part 'health_checkup_repository.g.dart';

class HealthCheckupRepository {
  HealthCheckupRepository(this._dio);

  final Dio _dio;

  Future<HealthCheckup> getHealthCheckup() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/wealth/health-checkup',
      );
      return HealthCheckup.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
HealthCheckupRepository healthCheckupRepository(Ref ref) {
  return HealthCheckupRepository(ref.watch(apiClientProvider));
}
