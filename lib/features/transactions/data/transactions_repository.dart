import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/transaction.dart';
import 'models/transaction_categories.dart';

part 'transactions_repository.g.dart';

class TransactionsRepository {
  TransactionsRepository(this._dio);

  final Dio _dio;
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<List<Transaction>> getTransactions({
    DateTime? from,
    DateTime? to,
    String? kategori,
    String? accountId,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'limit': limit,
        'offset': offset,
      };
      if (from != null) {
        queryParameters['from'] = _dateFormatter.format(from);
      }
      if (to != null) {
        queryParameters['to'] = _dateFormatter.format(to);
      }
      if (kategori != null && kategori.isNotEmpty) {
        queryParameters['kategori'] = kategori;
      }
      if (accountId != null && accountId.isNotEmpty) {
        queryParameters['accountId'] = accountId;
      }

      final response = await _dio.get<List<dynamic>>(
        '/api/transactions',
        queryParameters: queryParameters,
      );
      final data = response.data ?? [];
      return data
          .map(
            (item) => Transaction.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Transaction> getTransaction(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/transactions/$id',
      );
      return Transaction.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionCategories> getCategories() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/transactions/categories',
      );
      return TransactionCategories.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Transaction> createTransaction({
    required DateTime tanggal,
    required TransactionType type,
    required String accountId,
    int? nominal,
    String? kategori,
    String? rincian,
    String? toAccountId,
    String? pemberiUtang,
    String? debtTipe,
    String? peminjam,
    String? relatedDebtId,
    String? relatedReceivableId,
    String? namaAset,
    double? jumlah,
    double? hargaSatuan,
  }) async {
    try {
      final body = <String, dynamic>{
        'tanggal': _dateFormatter.format(tanggal),
        'type': _typeToJson(type),
        'accountId': accountId,
      };

      if (type.needsAssetEntity) {
        body['namaAset'] = namaAset;
        body['jumlah'] = jumlah;
        body['hargaSatuan'] = hargaSatuan;
      } else {
        body['nominal'] = nominal;
      }

      if (kategori != null && kategori.isNotEmpty) {
        body['kategori'] = kategori;
      }
      if (rincian != null && rincian.isNotEmpty) {
        body['rincian'] = rincian;
      }

      switch (type) {
        case TransactionType.transfer:
          if (toAccountId != null && toAccountId.isNotEmpty) {
            body['toAccountId'] = toAccountId;
          }
        case TransactionType.pinjamanUtang:
          body['pemberiUtang'] = pemberiUtang;
          if (debtTipe != null && debtTipe.isNotEmpty) {
            body['debtTipe'] = debtTipe;
          }
        case TransactionType.pemberianPiutang:
          body['peminjam'] = peminjam;
        case TransactionType.bayarUtang:
          body['relatedDebtId'] = relatedDebtId;
        case TransactionType.penerimaanPiutang:
          body['relatedReceivableId'] = relatedReceivableId;
        default:
          break;
      }

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/transactions',
        data: body,
      );
      return Transaction.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Transaction> updateTransaction({
    required String id,
    DateTime? tanggal,
    int? nominal,
    String? accountId,
    String? kategori,
    String? rincian,
    String? toAccountId,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (tanggal != null) {
        body['tanggal'] = _dateFormatter.format(tanggal);
      }
      if (nominal != null) {
        body['nominal'] = nominal;
      }
      if (accountId != null) {
        body['accountId'] = accountId;
      }
      if (kategori != null) {
        body['kategori'] = kategori;
      }
      if (rincian != null) {
        body['rincian'] = rincian;
      }
      if (toAccountId != null) {
        body['toAccountId'] = toAccountId;
      }

      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/transactions/$id',
        data: body,
      );
      return Transaction.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await _dio.delete<void>('/api/transactions/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  String _typeToJson(TransactionType type) {
    return switch (type) {
      TransactionType.pendapatan => 'pendapatan',
      TransactionType.pengeluaran => 'pengeluaran',
      TransactionType.transfer => 'transfer',
      TransactionType.pinjamanUtang => 'pinjaman_utang',
      TransactionType.bayarUtang => 'bayar_utang',
      TransactionType.pemberianPiutang => 'pemberian_piutang',
      TransactionType.penerimaanPiutang => 'penerimaan_piutang',
      TransactionType.beliBarang => 'beli_barang',
      TransactionType.jualBarang => 'jual_barang',
      TransactionType.beliInvestasi => 'beli_investasi',
      TransactionType.jualInvestasi => 'jual_investasi',
    };
  }
}

@riverpod
TransactionsRepository transactionsRepository(Ref ref) {
  return TransactionsRepository(ref.watch(apiClientProvider));
}
