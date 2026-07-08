import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_exception.dart';
import '../models/checklist_item.dart';

part 'checklist_repository.g.dart';

class ChecklistRepository {
  ChecklistRepository(this._dio);

  final Dio _dio;

  Future<List<ChecklistItem>> getChecklist(String category) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/api/checklist',
        queryParameters: {'category': category},
      );

      final data = response.data ?? const [];
      return data
          .map(
            (item) => ChecklistItem.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<ChecklistItem> toggleChecklistItem({
    required String itemKey,
    required String category,
    required bool checked,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/checklist/$itemKey',
        data: {
          'category': category,
          'checked': checked,
        },
      );
      return ChecklistItem.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
ChecklistRepository checklistRepository(Ref ref) {
  return ChecklistRepository(ref.watch(apiClientProvider));
}
