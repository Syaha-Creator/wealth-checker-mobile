import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/health_checkup/data/health_checkup_repository.dart';
import 'package:wealth_checker_mobile/features/health_checkup/data/models/health_checkup.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
  }) : _onGet = onGet;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onGet!(
      path,
      queryParameters: queryParameters?.cast<String, dynamic>(),
    );
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _healthCheckupJson = {
  'wealthLevel': 3,
  'wealthLevelName': 'Gaji ke Gaji',
  'diagnosa': 'Kekayaan bersih positif, namun belum ada dana darurat.',
  'saran': 'Bangun dana darurat 3-6 bulan pengeluaran.',
  'ciri': [
    'Kekayaan bersih positif',
    'Belum ada dana darurat memadai',
    'Hidup bergantung pada gaji bulanan',
  ],
  'kekayaanBersih': 5000000,
  'totalAset': 6000000,
  'totalUtang': 1000000,
};

void main() {
  group('HealthCheckupRepository.getHealthCheckup', () {
    test('GET /api/wealth/health-checkup and parses response', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/wealth/health-checkup');
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: _healthCheckupJson,
          );
        },
      );

      final repository = HealthCheckupRepository(dio);
      final checkup = await repository.getHealthCheckup();

      expect(checkup, isA<HealthCheckup>());
      expect(checkup.wealthLevel, 3);
      expect(checkup.wealthLevelName, 'Gaji ke Gaji');
      expect(checkup.ciri, hasLength(3));
      expect(checkup.diagnosa, isNotEmpty);
      expect(checkup.saran, isNotEmpty);
    });
  });
}
