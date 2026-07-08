import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/shared/data/checklist_repository.dart';
import 'package:wealth_checker_mobile/shared/models/checklist_item.dart';

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
    })? onPatch,
  })  : _onGet = onGet,
        _onPatch = onPatch;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  })? _onPatch;

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
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onPatch!(path, data: data);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _legacyItemJson = {
  'itemKey': 'buat_surat_wasiat',
  'isChecked': true,
  'updatedAt': '2026-07-01T10:30:00.000Z',
};

void main() {
  group('ChecklistRepository.getChecklist', () {
    test('GET /api/checklist?category=X returns parsed items', () async {
      String? capturedCategory;

      final repository = ChecklistRepository(
        _FakeDio(
          onGet: (path, {queryParameters}) async {
            capturedCategory = queryParameters?['category'] as String?;
            return Response(
              requestOptions: RequestOptions(path: path),
              data: [_legacyItemJson],
              statusCode: 200,
            );
          },
        ),
      );

      final items = await repository.getChecklist('legacy_planning');

      expect(capturedCategory, 'legacy_planning');
      expect(items, hasLength(1));
      expect(items.first, isA<ChecklistItem>());
      expect(items.first.itemKey, 'buat_surat_wasiat');
      expect(items.first.isChecked, isTrue);
    });

    test('GET /api/checklist returns empty list when API returns []', () async {
      final repository = ChecklistRepository(
        _FakeDio(
          onGet: (path, {queryParameters}) async {
            return Response(
              requestOptions: RequestOptions(path: path),
              data: <dynamic>[],
              statusCode: 200,
            );
          },
        ),
      );

      final items = await repository.getChecklist('budgeting_tips');
      expect(items, isEmpty);
    });
  });

  group('ChecklistRepository.toggleChecklistItem', () {
    test('PATCH /api/checklist/:itemKey with category and checked', () async {
      String? capturedPath;
      Map<String, dynamic>? capturedBody;

      final repository = ChecklistRepository(
        _FakeDio(
          onPatch: (path, {data, queryParameters}) async {
            capturedPath = path;
            capturedBody = Map<String, dynamic>.from(data! as Map);
            return Response(
              requestOptions: RequestOptions(path: path),
              data: _legacyItemJson,
              statusCode: 200,
            );
          },
        ),
      );

      final item = await repository.toggleChecklistItem(
        itemKey: 'buat_surat_wasiat',
        category: 'legacy_planning',
        checked: true,
      );

      expect(capturedPath, '/api/checklist/buat_surat_wasiat');
      expect(capturedBody, {
        'category': 'legacy_planning',
        'checked': true,
      });
      expect(item.itemKey, 'buat_surat_wasiat');
      expect(item.isChecked, isTrue);
    });
  });
}
