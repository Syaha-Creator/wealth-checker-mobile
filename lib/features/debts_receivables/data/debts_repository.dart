import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/debt.dart';
import 'models/receivable.dart';

part 'debts_repository.g.dart';

class DebtsRepository {
  DebtsRepository(this._dio);

  final Dio _dio;

  Future<List<Debt>> getDebts() async {
    try {
      final response = await _dio.get<List<dynamic>>('/api/debts');
      final data = response.data ?? [];
      return data
          .map((item) => Debt.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Debt> createDebt({
    required String pemberiUtang,
    required String tipe,
    required double saldoAwal,
    double? sisaSaldo,
  }) async {
    try {
      final body = <String, dynamic>{
        'pemberiUtang': pemberiUtang,
        'tipe': tipe,
        'saldoAwal': saldoAwal,
      };
      if (sisaSaldo != null) {
        body['sisaSaldo'] = sisaSaldo;
      }

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/debts',
        data: body,
      );
      return Debt.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Debt> updateDebt({
    required String id,
    String? pemberiUtang,
    String? tipe,
    double? saldoAwal,
    double? sisaSaldo,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (pemberiUtang != null) {
        body['pemberiUtang'] = pemberiUtang;
      }
      if (tipe != null) {
        body['tipe'] = tipe;
      }
      if (saldoAwal != null) {
        body['saldoAwal'] = saldoAwal;
      }
      if (sisaSaldo != null) {
        body['sisaSaldo'] = sisaSaldo;
      }

      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/debts/$id',
        data: body,
      );
      return Debt.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteDebt(String id) async {
    try {
      await _dio.delete<void>('/api/debts/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<Receivable>> getReceivables() async {
    try {
      final response = await _dio.get<List<dynamic>>('/api/debts/receivables');
      final data = response.data ?? [];
      return data
          .map(
            (item) => Receivable.fromJson(Map<String, dynamic>.from(item as Map)),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Receivable> createReceivable({
    required String peminjam,
    required double saldoAwal,
    double? sisaSaldo,
  }) async {
    try {
      final body = <String, dynamic>{
        'peminjam': peminjam,
        'saldoAwal': saldoAwal,
      };
      if (sisaSaldo != null) {
        body['sisaSaldo'] = sisaSaldo;
      }

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/debts/receivables',
        data: body,
      );
      return Receivable.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Receivable> updateReceivable({
    required String id,
    String? peminjam,
    double? saldoAwal,
    double? sisaSaldo,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (peminjam != null) {
        body['peminjam'] = peminjam;
      }
      if (saldoAwal != null) {
        body['saldoAwal'] = saldoAwal;
      }
      if (sisaSaldo != null) {
        body['sisaSaldo'] = sisaSaldo;
      }

      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/debts/receivables/$id',
        data: body,
      );
      return Receivable.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteReceivable(String id) async {
    try {
      await _dio.delete<void>('/api/debts/receivables/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
DebtsRepository debtsRepository(Ref ref) {
  return DebtsRepository(ref.watch(apiClientProvider));
}
