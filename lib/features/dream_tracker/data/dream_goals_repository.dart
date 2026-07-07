import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/dream_goal.dart';
import 'models/dream_goal_input.dart';

part 'dream_goals_repository.g.dart';

class DreamGoalsRepository {
  DreamGoalsRepository(this._dio);

  final Dio _dio;

  Future<List<DreamGoal>> getDreamGoals() async {
    try {
      final response = await _dio.get<List<dynamic>>('/api/dream-goals');
      final data = response.data ?? [];
      return data
          .map(
            (item) => DreamGoal.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DreamGoalRecord> createDreamGoal(DreamGoalInput input) async {
    input.validate();
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/dream-goals',
        data: input.toCreateJson(),
      );
      return DreamGoalRecord.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DreamGoalRecord> updateDreamGoal({
    required String id,
    required DreamGoalInput input,
  }) async {
    input.validate();
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/dream-goals/$id',
        data: input.toUpdateJson(),
      );
      return DreamGoalRecord.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteDreamGoal(String id) async {
    try {
      await _dio.delete<void>('/api/dream-goals/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
DreamGoalsRepository dreamGoalsRepository(Ref ref) {
  return DreamGoalsRepository(ref.watch(apiClientProvider));
}
