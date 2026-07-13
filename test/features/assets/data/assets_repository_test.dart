import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/assets/data/assets_repository.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/fixed_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/liquid_asset_holding.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
    })? onPatch,
    Future<Response<dynamic>> Function(String path)? onDelete,
  })  : _onGet = onGet,
        _onPatch = onPatch,
        _onDelete = onDelete;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
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

const _liquidJson = {
  'id': 'liq-1',
  'userId': 'user-1',
  'namaAset': 'Reksa Dana Saham',
  'jumlah': '10',
  'hargaBeliRataRata': '15000',
  'updatedAt': '2026-07-01T00:00:00.000Z',
};

const _fixedJson = {
  'id': 'fix-1',
  'userId': 'user-1',
  'namaAset': 'Laptop',
  'jumlah': '1',
  'hargaBeliRataRata': '12000000',
  'updatedAt': '2026-07-01T00:00:00.000Z',
};

void main() {
  group('AssetsRepository.getLiquidAssetHoldings', () {
    test('GET /api/assets/liquid without query by default', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/assets/liquid');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [_liquidJson],
          );
        },
      );

      final repository = AssetsRepository(dio);
      final holdings = await repository.getLiquidAssetHoldings();

      expect(capturedQuery, isNull);
      expect(holdings, hasLength(1));
      expect(holdings.single, isA<LiquidAssetHolding>());
      expect(holdings.single.namaAset, 'Reksa Dana Saham');
      expect(holdings.single.jumlah, 10);
      expect(holdings.single.hargaBeliRataRata, 15000);
    });

    test('GET /api/assets/liquid?all=true when all is true', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [],
          );
        },
      );

      final repository = AssetsRepository(dio);
      await repository.getLiquidAssetHoldings(all: true);

      expect(capturedQuery, {'all': 'true'});
    });
  });

  group('AssetsRepository.getFixedAssetHoldings', () {
    test('GET /api/assets/fixed and parses holdings', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/assets/fixed');
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [_fixedJson],
          );
        },
      );

      final repository = AssetsRepository(dio);
      final holdings = await repository.getFixedAssetHoldings();

      expect(capturedQuery, isNull);
      expect(holdings, hasLength(1));
      expect(holdings.single, isA<FixedAssetHolding>());
      expect(holdings.single.namaAset, 'Laptop');
      expect(holdings.single.jumlah, 1);
      expect(holdings.single.hargaBeliRataRata, 12000000);
    });

    test('GET /api/assets/fixed?all=true when all is true', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          capturedQuery = queryParameters;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [],
          );
        },
      );

      final repository = AssetsRepository(dio);
      await repository.getFixedAssetHoldings(all: true);

      expect(capturedQuery, {'all': 'true'});
    });
  });

  group('AssetsRepository liquid mutations', () {
    test('updateLiquidAsset patches holding fields', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPatch: (path, {data}) async {
          expect(path, '/api/assets/liquid/liq-1');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {..._liquidJson, 'jumlah': '20'},
          );
        },
      );

      final repository = AssetsRepository(dio);
      final holding = await repository.updateLiquidAsset(
        id: 'liq-1',
        jumlah: 20,
      );

      expect(capturedBody, {'jumlah': 20});
      expect(holding.jumlah, 20);
    });

    test('deleteLiquidAsset calls DELETE endpoint', () async {
      String? deletedPath;
      final dio = _FakeDio(
        onDelete: (path) async {
          deletedPath = path;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 204,
          );
        },
      );

      final repository = AssetsRepository(dio);
      await repository.deleteLiquidAsset('liq-1');

      expect(deletedPath, '/api/assets/liquid/liq-1');
    });
  });

  group('AssetsRepository fixed mutations', () {
    test('updateFixedAsset patches holding fields', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPatch: (path, {data}) async {
          expect(path, '/api/assets/fixed/fix-1');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {..._fixedJson, 'namaAset': 'MacBook'},
          );
        },
      );

      final repository = AssetsRepository(dio);
      final holding = await repository.updateFixedAsset(
        id: 'fix-1',
        namaAset: 'MacBook',
      );

      expect(capturedBody, {'namaAset': 'MacBook'});
      expect(holding.namaAset, 'MacBook');
    });

    test('deleteFixedAsset calls DELETE endpoint', () async {
      String? deletedPath;
      final dio = _FakeDio(
        onDelete: (path) async {
          deletedPath = path;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 204,
          );
        },
      );

      final repository = AssetsRepository(dio);
      await repository.deleteFixedAsset('fix-1');

      expect(deletedPath, '/api/assets/fixed/fix-1');
    });
  });
}
