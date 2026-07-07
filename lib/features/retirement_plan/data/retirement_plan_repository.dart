import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/retirement_plan.dart';

part 'retirement_plan_repository.g.dart';

class RetirementPlanRepository {
  RetirementPlanRepository(this._dio);

  final Dio _dio;

  /// Uses server default `mode=simple` — no query param sent in Sprint 10.
  Future<RetirementPlan> getRetirementPlan() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/wealth/retirement-plan',
      );
      return RetirementPlan.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
RetirementPlanRepository retirementPlanRepository(Ref ref) {
  return RetirementPlanRepository(ref.watch(apiClientProvider));
}
