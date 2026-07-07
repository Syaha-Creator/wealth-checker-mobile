import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/dream_tracker/data/dream_goals_repository.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/data/models/dream_goal.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/data/models/dream_goal_input.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
    })? onPost,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
    })? onPatch,
    Future<Response<dynamic>> Function(String path)? onDelete,
  })  : _onGet = onGet,
        _onPost = onPost,
        _onPatch = onPatch,
        _onDelete = onDelete;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
  })? _onPost;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
  })? _onPatch;
  final Future<Response<dynamic>> Function(String path)? _onDelete;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onGet!(path, queryParameters: queryParameters);
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
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _onDelete!(path);
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
  group('DreamGoalInput', () {
    test('rejects accountId and saldoManual together', () {
      const input = DreamGoalInput(
        namaGoal: 'Liburan',
        targetNominal: 10000000,
        accountId: 'acc-1',
        saldoManual: 5000000,
      );

      expect(() => input.validate(), throwsA(isA<DreamGoalInputException>()));
      expect(() => input.toCreateJson(), throwsA(isA<DreamGoalInputException>()));
    });

    test('toCreateJson sends accountId only when linked', () {
      const input = DreamGoalInput(
        namaGoal: 'Liburan',
        targetNominal: 20000000,
        accountId: 'acc-1',
      );

      expect(input.toCreateJson(), {
        'namaGoal': 'Liburan',
        'targetNominal': 20000000,
        'accountId': 'acc-1',
      });
    });

    test('toCreateJson sends saldoManual only when manual', () {
      const input = DreamGoalInput(
        namaGoal: 'Pendidikan',
        targetNominal: 50000000,
        saldoManual: 5000000,
      );

      expect(input.toCreateJson(), {
        'namaGoal': 'Pendidikan',
        'targetNominal': 50000000,
        'saldoManual': 5000000,
      });
    });

    test('toUpdateJson sends accountId null when unlinking', () {
      const input = DreamGoalInput(
        namaGoal: 'Liburan',
        targetNominal: 20000000,
        saldoManual: 3000000,
        unlinkAccount: true,
      );

      expect(input.toUpdateJson(), {
        'namaGoal': 'Liburan',
        'targetNominal': 20000000,
        'accountId': null,
        'saldoManual': 3000000,
      });
    });
  });

  group('DreamGoalsRepository', () {
    test('GET /api/dream-goals parses computed list shape', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/dream-goals');
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [
              {
                'id': 'goal-1',
                'namaGoal': 'Liburan ke Jepang',
                'accountId': 'acc-1',
                'targetNominal': 20000000,
                'saldoSaatIni': 12000000,
                'persentase': 60,
                'tercapai': false,
                'sisaMenujuTarget': 8000000,
              },
            ],
          );
        },
      );

      final repository = DreamGoalsRepository(dio);
      final goals = await repository.getDreamGoals();

      expect(goals, hasLength(1));
      expect(goals.first, isA<DreamGoal>());
      expect(goals.first.persentase, 60);
      expect(goals.first.isLinkedToAccount, isTrue);
    });

    test('POST /api/dream-goals rejects mutually exclusive fields client-side',
        () async {
      final repository = DreamGoalsRepository(_FakeDio());

      expect(
        () => repository.createDreamGoal(
          const DreamGoalInput(
            namaGoal: 'Liburan',
            targetNominal: 10000000,
            accountId: 'acc-1',
            saldoManual: 1000000,
          ),
        ),
        throwsA(isA<DreamGoalInputException>()),
      );
    });

    test('POST /api/dream-goals with accountId', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data}) async {
          expect(path, '/api/dream-goals');
          capturedBody = data as Map<String, dynamic>?;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: {
              'id': 'goal-new',
              'namaGoal': 'Liburan',
              'targetNominal': 20000000,
              'accountId': 'acc-1',
            },
          );
        },
      );

      final repository = DreamGoalsRepository(dio);
      final record = await repository.createDreamGoal(
        const DreamGoalInput(
          namaGoal: 'Liburan',
          targetNominal: 20000000,
          accountId: 'acc-1',
        ),
      );

      expect(capturedBody, {
        'namaGoal': 'Liburan',
        'targetNominal': 20000000,
        'accountId': 'acc-1',
      });
      expect(record, isA<DreamGoalRecord>());
      expect(record.id, 'goal-new');
      expect(record.accountId, 'acc-1');
    });

    test('DELETE /api/dream-goals/:id returns without body', () async {
      var deleted = false;
      final dio = _FakeDio(
        onDelete: (path) async {
          expect(path, '/api/dream-goals/goal-1');
          deleted = true;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 204,
          );
        },
      );

      final repository = DreamGoalsRepository(dio);
      await repository.deleteDreamGoal('goal-1');

      expect(deleted, isTrue);
    });
  });
}
