import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/budget_plan.dart';
import 'models/budgeting_advice.dart';

part 'budgeting_repository.g.dart';

class BudgetingRepository {
  BudgetingRepository(this._dio);

  final Dio _dio;
  static final _monthFormatter = DateFormat('yyyy-MM');

  String currentBulanTahun() => _monthFormatter.format(DateTime.now());

  /// Upserts on `(userId, bulanTahun)` — safe to call twice for the same month.
  Future<BudgetPlan> createOrUpdateBudgetPlan({
    required int rencanaPemasukanBulanan,
    String? bulanTahun,
  }) async {
    try {
      final body = <String, dynamic>{
        'rencanaPemasukanBulanan': rencanaPemasukanBulanan,
      };
      final month = bulanTahun ?? currentBulanTahun();
      body['bulanTahun'] = month;

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/budget-plans',
        data: body,
      );
      return BudgetPlan.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<BudgetPlan?> getCurrentBudgetPlan({String? bulanTahun}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (bulanTahun != null && bulanTahun.isNotEmpty) {
        queryParameters['bulanTahun'] = bulanTahun;
      }

      final response = await _dio.get<dynamic>(
        '/api/budget-plans/current',
        queryParameters: queryParameters.isEmpty ? null : queryParameters,
      );

      final data = response.data;
      if (data == null) {
        return null;
      }
      return BudgetPlan.fromJson(Map<String, dynamic>.from(data as Map));
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<BudgetingAdvice> getBudgetingAdvice({String? bulanTahun}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (bulanTahun != null && bulanTahun.isNotEmpty) {
        queryParameters['bulanTahun'] = bulanTahun;
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/budgeting-advice',
        queryParameters: queryParameters.isEmpty ? null : queryParameters,
      );
      return BudgetingAdvice.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
BudgetingRepository budgetingRepository(Ref ref) {
  return BudgetingRepository(ref.watch(apiClientProvider));
}
