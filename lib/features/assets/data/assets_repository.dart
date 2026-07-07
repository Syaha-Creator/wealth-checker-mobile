import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/fixed_asset_holding.dart';
import 'models/liquid_asset_holding.dart';

part 'assets_repository.g.dart';

class AssetsRepository {
  AssetsRepository(this._dio);

  final Dio _dio;

  /// Onboarding snapshot — do not use for ongoing buy/sell transactions.
  Future<void> createLiquidAsset({
    required String namaAset,
    required double jumlah,
    required double hargaBeliRataRata,
  }) async {
    try {
      await _dio.post<void>(
        '/api/assets/liquid',
        data: {
          'namaAset': namaAset,
          'jumlah': jumlah,
          'hargaBeliRataRata': hargaBeliRataRata,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  /// Onboarding snapshot — do not use for ongoing buy/sell transactions.
  Future<void> createFixedAsset({
    required String namaAset,
    required double jumlah,
    required double hargaBeliRataRata,
  }) async {
    try {
      await _dio.post<void>(
        '/api/assets/fixed',
        data: {
          'namaAset': namaAset,
          'jumlah': jumlah,
          'hargaBeliRataRata': hargaBeliRataRata,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<LiquidAssetHolding>> getLiquidAssetHoldings({
    bool all = false,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/api/assets/liquid',
        queryParameters: all ? {'all': 'true'} : null,
      );
      final data = response.data ?? [];
      return data
          .map(
            (item) => LiquidAssetHolding.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<FixedAssetHolding>> getFixedAssetHoldings({
    bool all = false,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/api/assets/fixed',
        queryParameters: all ? {'all': 'true'} : null,
      );
      final data = response.data ?? [];
      return data
          .map(
            (item) => FixedAssetHolding.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
AssetsRepository assetsRepository(Ref ref) {
  return AssetsRepository(ref.watch(apiClientProvider));
}
