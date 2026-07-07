import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/budget_vs_actual.dart';
import 'models/emergency_fund.dart';
import 'models/essential_expenses.dart';
import 'models/income_report.dart';
import 'models/monthly_profit_loss.dart';

part 'analytics_repository.g.dart';

class AnalyticsRepository {
  AnalyticsRepository(this._dio);

  final Dio _dio;
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<List<MonthlyProfitLoss>> getMonthlyPl({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/api/analytics/monthly-pl',
        queryParameters: {
          'from': _dateFormatter.format(from),
          'to': _dateFormatter.format(to),
        },
      );
      final data = response.data ?? [];
      return data
          .map(
            (item) => MonthlyProfitLoss.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<BudgetVsActual> getBudgetVsActual({
    required DateTime from,
    required DateTime to,
    String? bulanTahun,
    String? kategoriPokok,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'from': _dateFormatter.format(from),
        'to': _dateFormatter.format(to),
      };
      if (bulanTahun != null && bulanTahun.isNotEmpty) {
        queryParameters['bulanTahun'] = bulanTahun;
      }
      if (kategoriPokok != null && kategoriPokok.isNotEmpty) {
        queryParameters['kategoriPokok'] = kategoriPokok;
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/analytics/budget-vs-actual',
        queryParameters: queryParameters,
      );
      return BudgetVsActual.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  /// Reflects the user's current state — deliberately takes no date range.
  Future<EmergencyFund> getEmergencyFund() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/analytics/emergency-fund',
      );
      return EmergencyFund.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<EssentialExpenses> getEssentialExpenses({
    required DateTime from,
    required DateTime to,
    String? kategori,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'from': _dateFormatter.format(from),
        'to': _dateFormatter.format(to),
      };
      if (kategori != null && kategori.isNotEmpty) {
        queryParameters['kategori'] = kategori;
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/analytics/essential-expenses',
        queryParameters: queryParameters,
      );
      return EssentialExpenses.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IncomeReport> getIncome({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/analytics/income',
        queryParameters: {
          'from': _dateFormatter.format(from),
          'to': _dateFormatter.format(to),
        },
      );
      return IncomeReport.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
AnalyticsRepository analyticsRepository(Ref ref) {
  return AnalyticsRepository(ref.watch(apiClientProvider));
}
