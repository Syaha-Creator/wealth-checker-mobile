import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/budgeting/data/budgeting_repository.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budget_plan.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budgeting_advice.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
    })? onPost,
  })  : _onGet = onGet,
        _onPost = onPost;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  })? _onPost;

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
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onPost!(path, data: data);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _budgetPlanJson = {
  'id': 'plan-1',
  'userId': 'user-1',
  'householdId': 'household-1',
  'rencanaPemasukanBulanan': '10000000.00',
  'bulanTahun': '2026-07',
  'createdAt': '2026-07-06T10:19:20.871Z',
};

const _budgetingAdviceJson = {
  'wealthLevel': 3,
  'hasPlan': true,
  'rencanaPemasukanBulanan': 10000000,
  'alokasi': [
    {'kategori': 'Kebutuhan Pokok', 'persen': 50, 'nominal': 5000000},
    {'kategori': 'Tabungan Darurat', 'persen': 30, 'nominal': 3000000},
    {'kategori': 'Investasi', 'persen': 10, 'nominal': 1000000},
    {'kategori': 'Gaya Hidup', 'persen': 10, 'nominal': 1000000},
  ],
  'totalPersen': 100,
  'sisaTidakTeralokasi': 0,
};

void main() {
  group('BudgetingRepository.createOrUpdateBudgetPlan', () {
    test('POST /api/budget-plans with rencanaPemasukanBulanan and bulanTahun',
        () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          expect(path, '/api/budget-plans');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _budgetPlanJson,
          );
        },
      );

      final repository = BudgetingRepository(dio);
      final plan = await repository.createOrUpdateBudgetPlan(
        rencanaPemasukanBulanan: 10000000,
        bulanTahun: '2026-07',
      );

      expect(capturedBody, {
        'rencanaPemasukanBulanan': 10000000,
        'bulanTahun': '2026-07',
      });
      expect(plan, isA<BudgetPlan>());
      expect(plan.rencanaPemasukanBulanan, 10000000);
      expect(plan.bulanTahun, '2026-07');
    });
  });

  group('BudgetingRepository.getCurrentBudgetPlan', () {
    test('GET /api/budget-plans/current returns null when no plan', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/budget-plans/current');
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: null,
          );
        },
      );

      final repository = BudgetingRepository(dio);
      final plan = await repository.getCurrentBudgetPlan(bulanTahun: '2026-07');

      expect(plan, isNull);
    });

    test('GET /api/budget-plans/current parses plan object', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(queryParameters, {'bulanTahun': '2026-07'});
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: _budgetPlanJson,
          );
        },
      );

      final repository = BudgetingRepository(dio);
      final plan = await repository.getCurrentBudgetPlan(bulanTahun: '2026-07');

      expect(plan?.id, 'plan-1');
    });
  });

  group('BudgetingRepository.getBudgetingAdvice', () {
    test('GET /api/budgeting-advice parses allocation array', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/budgeting-advice');
          expect(queryParameters, {'bulanTahun': '2026-07'});
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: _budgetingAdviceJson,
          );
        },
      );

      final repository = BudgetingRepository(dio);
      final advice = await repository.getBudgetingAdvice(bulanTahun: '2026-07');

      expect(advice, isA<BudgetingAdvice>());
      expect(advice.hasPlan, isTrue);
      expect(advice.alokasi, hasLength(4));
      expect(advice.alokasi.first.kategori, 'Kebutuhan Pokok');
    });
  });
}
