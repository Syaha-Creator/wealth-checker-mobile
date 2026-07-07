import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/retirement_plan/data/retirement_plan_repository.dart';

class _FakeDio implements Dio {
  _FakeDio({
    required Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    }) onGet,
  }) : _onGet = onGet;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) _onGet;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onGet(path, queryParameters: queryParameters);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('RetirementPlanRepository.getRetirementPlan', () {
    test('GET /api/wealth/retirement-plan sends no mode query param', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/wealth/retirement-plan');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'hasProfile': false,
              'error':
                  'Lengkapi tanggal lahir, rencana usia pensiun, dan rencana usia warisan di halaman Profil untuk melihat rencana pensiun.',
            },
          );
        },
      );

      final repository = RetirementPlanRepository(dio);
      final plan = await repository.getRetirementPlan();

      expect(capturedQuery, isNull);
      expect(plan.hasProfile, isFalse);
      expect(plan.isComplete, isFalse);
      expect(plan.error, isNotNull);
    });

    test('parses complete plan with negative years and null debt payoff',
        () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              'hasProfile': true,
              'mode': 'simple',
              'plan': {
                'tahunMenujuPensiun': -2,
                'tahunMenujuWarisan': 30,
                'danaDibutuhkanSebelumPensiun': 0,
                'danaDibutuhkanSelamaPensiun': 1500000000,
                'totalDanaPensiunWarisan': 1500000000,
              },
              'sisaUangBulanan': -500000,
              'danaTerkumpulSaatIni': 10000000,
              'selisihMenujuTarget': 1490000000,
              'collectedFunds': {
                'danaDaruratTerkumpul': 10000000,
                'danaPensiunTerkumpul': 0,
                'danaWarisanTerkumpul': 0,
              },
              'debtPayoff': {
                'bisaLunasSekarang': false,
                'bulanLunasDenganKas': null,
                'bulanLunasDenganSisaGaji': null,
              },
              'realizedPL': {
                'untungRugiJualBarang': 250000,
                'untungRugiInvestasi': -100000,
              },
            },
          );
        },
      );

      final repository = RetirementPlanRepository(dio);
      final plan = await repository.getRetirementPlan();

      expect(plan.isComplete, isTrue);
      expect(plan.plan!.tahunMenujuPensiun, -2);
      expect(plan.debtPayoff!.bulanLunasDenganKas, isNull);
      expect(plan.debtPayoff!.bulanLunasDenganSisaGaji, isNull);
      expect(plan.realizedPL!.untungRugiInvestasi, -100000);
    });
  });
}
