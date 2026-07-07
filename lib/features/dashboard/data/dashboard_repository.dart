import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/monthly_cash_flow.dart';
import 'models/wealth_history_point.dart';
import 'models/wealth_summary.dart';

part 'dashboard_repository.g.dart';

class DashboardRepository {
  DashboardRepository(this._dio);

  final Dio _dio;
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<WealthSummary> getWealthSummary() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/wealth/summary',
      );
      return WealthSummary.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<MonthlyCashFlow> getMonthlyCashFlow() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/wealth/monthly-cash-flow',
      );
      return MonthlyCashFlow.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<WealthHistory> getWealthHistory({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/wealth/wealth-history',
        queryParameters: {
          'from': _dateFormatter.format(from),
          'to': _dateFormatter.format(to),
        },
      );
      return WealthHistory.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepository(ref.watch(apiClientProvider));
}
