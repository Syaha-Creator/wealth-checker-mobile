import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/analytics/data/analytics_repository.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/budget_vs_actual.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/emergency_fund.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/essential_expenses.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/income_report.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/monthly_profit_loss.dart';

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

const _monthlyPlJson = [
  {
    'bulan': '2026-06',
    'pendapatan': 10000000,
    'pinjamanMasuk': 0,
    'bayarUtang': 500000,
    'piutangTerbayar': 0,
    'pengeluaran': 7500000,
    'tabungan': 2500000,
    'tabunganNegatif': false,
  },
  {
    'bulan': '2026-07',
    'pendapatan': 8000000,
    'pinjamanMasuk': 0,
    'bayarUtang': 0,
    'piutangTerbayar': 0,
    'pengeluaran': 9000000,
    'tabungan': -1000000,
    'tabunganNegatif': true,
  },
];

void main() {
  group('AnalyticsRepository.getMonthlyPl', () {
    test('GET /api/analytics/monthly-pl with from and to query params',
        () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/analytics/monthly-pl');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: _monthlyPlJson,
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final rows = await repository.getMonthlyPl(
        from: DateTime(2026, 6, 1),
        to: DateTime(2026, 7, 31),
      );

      expect(capturedQuery, {
        'from': '2026-06-01',
        'to': '2026-07-31',
      });
      expect(rows, hasLength(2));
      expect(rows.first, isA<MonthlyProfitLoss>());
      expect(rows.first.bulan, '2026-06');
      expect(rows.first.tabungan, 2500000);
      expect(rows.last.tabunganNegatif, isTrue);
    });
  });

  group('AnalyticsRepository.getBudgetVsActual', () {
    test('GET /api/analytics/budget-vs-actual with from/to and parses nulls',
        () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/analytics/budget-vs-actual');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'wealthLevel': 5,
              'hasPlan': true,
              'pendapatan': {
                'rencanaNominal': 10000000,
                'aktualNominal': 9500000,
              },
              'alokasi': [
                {
                  'kategori': 'Kebutuhan Pokok',
                  'rencanaNominal': 3500000,
                  'aktualNominal': 3800000,
                  'selisih': 300000,
                  'selisihPersen': 8.6,
                  'overBudget': true,
                },
                {
                  'kategori': 'Dana Warisan',
                  'rencanaNominal': 0,
                  'aktualNominal': 0,
                  'selisih': 0,
                  'selisihPersen': null,
                  'overBudget': false,
                },
              ],
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getBudgetVsActual(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
      );

      expect(capturedQuery, {
        'from': '2026-07-01',
        'to': '2026-07-31',
      });
      expect(data, isA<BudgetVsActual>());
      expect(data.hasPlan, isTrue);
      expect(data.pendapatan?.rencanaNominal, 10000000);
      expect(data.alokasi, hasLength(2));
      expect(data.alokasi.first.overBudget, isTrue);
      expect(data.alokasi.first.selisihPersen, 8.6);
      expect(data.alokasi.last.selisihPersen, isNull);
    });

    test('sends optional bulanTahun and kategoriPokok when provided',
        () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'wealthLevel': -1,
              'hasPlan': false,
              'pendapatan': null,
              'alokasi': <dynamic>[],
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getBudgetVsActual(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
        bulanTahun: '2026-07',
        kategoriPokok: 'Konsumsi,Transportasi',
      );

      expect(capturedQuery, {
        'from': '2026-07-01',
        'to': '2026-07-31',
        'bulanTahun': '2026-07',
        'kategoriPokok': 'Konsumsi,Transportasi',
      });
      expect(data.hasNoFinancialData, isTrue);
      expect(data.pendapatan, isNull);
      expect(data.alokasi, isEmpty);
    });
  });

  group('AnalyticsRepository.getEmergencyFund', () {
    test('GET /api/analytics/emergency-fund sends NO date query params',
        () async {
      Map<String, dynamic>? capturedQuery;
      var captured = false;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/analytics/emergency-fund');
          capturedQuery = queryParameters;
          captured = true;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'danaDarurat': 15000000,
              'status': 'cukup',
              'bulanTertanggung': 5.5,
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getEmergencyFund();

      expect(captured, isTrue);
      expect(capturedQuery, isNull);
      expect(data, isA<EmergencyFund>());
      expect(data.danaDarurat, 15000000);
      expect(data.isCukup, isTrue);
      expect(data.bulanTertanggung, 5.5);
    });

    test('parses null bulanTertanggung', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'danaDarurat': 0,
              'status': 'belum_cukup',
              'bulanTertanggung': null,
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getEmergencyFund();

      expect(data.isCukup, isFalse);
      expect(data.bulanTertanggung, isNull);
    });
  });

  group('AnalyticsRepository.getEssentialExpenses', () {
    test('GET /api/analytics/essential-expenses with from/to', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/analytics/essential-expenses');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'categories': ['Konsumsi', 'Transportasi'],
              'items': [
                {
                  'kategori': 'Konsumsi',
                  'rincianList': [
                    {'rincian': 'Makan siang', 'total': 500000},
                  ],
                  'subtotal': 500000,
                },
              ],
              'grandTotal': 500000,
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getEssentialExpenses(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
      );

      expect(capturedQuery, {
        'from': '2026-07-01',
        'to': '2026-07-31',
      });
      expect(data, isA<EssentialExpenses>());
      expect(data.items.single.kategori, 'Konsumsi');
      expect(data.items.single.rincianList.single.total, 500000);
      expect(data.grandTotal, 500000);
    });

    test('sends optional kategori override when provided', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'categories': <dynamic>[],
              'items': <dynamic>[],
              'grandTotal': 0,
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      await repository.getEssentialExpenses(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
        kategori: 'Konsumsi,Kesehatan',
      );

      expect(capturedQuery?['kategori'], 'Konsumsi,Kesehatan');
    });
  });

  group('AnalyticsRepository.getIncome', () {
    test('GET /api/analytics/income with from/to', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/analytics/income');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'items': [
                {
                  'kategori': 'Gaji',
                  'total': 9000000,
                  'persentaseDariTotal': 90,
                  'isTerbesar': true,
                },
                {
                  'kategori': 'Bonus',
                  'total': 1000000,
                  'persentaseDariTotal': 10,
                  'isTerbesar': false,
                },
              ],
              'grandTotal': 10000000,
            },
          );
        },
      );

      final repository = AnalyticsRepository(dio);
      final data = await repository.getIncome(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
      );

      expect(capturedQuery, {
        'from': '2026-07-01',
        'to': '2026-07-31',
      });
      expect(data, isA<IncomeReport>());
      expect(data.items, hasLength(2));
      expect(data.items.first.isTerbesar, isTrue);
      expect(data.items.first.persentaseDariTotal, 90);
      expect(data.grandTotal, 10000000);
    });
  });
}
