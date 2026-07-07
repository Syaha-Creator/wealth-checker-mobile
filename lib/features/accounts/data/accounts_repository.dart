import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'models/account.dart';
import 'models/account_mutation.dart';

part 'accounts_repository.g.dart';

class AccountsRepository {
  AccountsRepository(this._dio);

  final Dio _dio;
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<List<Account>> getAccounts() async {
    try {
      final response = await _dio.get<List<dynamic>>('/api/accounts');
      final data = response.data ?? [];
      return data
          .map((item) => Account.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Account> createAccount({
    required String nama,
    required double saldoAwal,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/accounts',
        data: {
          'nama': nama,
          'saldoAwal': saldoAwal,
        },
      );
      return Account.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<Account> updateAccount({
    required String id,
    String? nama,
    bool? isActive,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (nama != null) {
        body['nama'] = nama;
      }
      if (isActive != null) {
        body['isActive'] = isActive;
      }

      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/accounts/$id',
        data: body,
      );
      return Account.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteAccount(String id) async {
    try {
      await _dio.delete<void>('/api/accounts/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<AccountMutation> getAccountMutation({
    required String accountId,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (from != null) {
        queryParameters['from'] = _dateFormatter.format(from);
      }
      if (to != null) {
        queryParameters['to'] = _dateFormatter.format(to);
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/accounts/$accountId/mutasi',
        queryParameters: queryParameters.isEmpty ? null : queryParameters,
      );
      return AccountMutation.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
AccountsRepository accountsRepository(Ref ref) {
  return AccountsRepository(ref.watch(apiClientProvider));
}
