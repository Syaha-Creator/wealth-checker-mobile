import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/dashboard/data/dashboard_repository.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_history_point.dart';

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

const _wealthHistoryJson = {
  'history': [
    {'tanggal': '2026-06-01', 'kekayaanBersih': 10000000},
    {'tanggal': '2026-07-01', 'kekayaanBersih': 12500000},
  ],
  'delta': 2500000,
};

void main() {
  group('DashboardRepository.getWealthHistory', () {
    test('GET /api/wealth/wealth-history with from and to query params',
        () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/wealth/wealth-history');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: _wealthHistoryJson,
          );
        },
      );

      final repository = DashboardRepository(dio);
      final history = await repository.getWealthHistory(
        from: DateTime(2026, 6, 1),
        to: DateTime(2026, 7, 31),
      );

      expect(capturedQuery, {
        'from': '2026-06-01',
        'to': '2026-07-31',
      });
      expect(history, isA<WealthHistory>());
      expect(history.history, hasLength(2));
      expect(history.delta, 2500000);
      expect(history.history.first.kekayaanBersih, 10000000);
    });
  });
}
