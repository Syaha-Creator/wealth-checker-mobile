import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../data/accounts_repository.dart';
import '../../data/models/account.dart';

part 'accounts_list_provider.g.dart';

@riverpod
class AccountsList extends _$AccountsList {
  @override
  Future<List<Account>> build() async {
    final accounts = await ref.read(accountsRepositoryProvider).getAccounts();
    return accounts.where((account) => account.isActive).toList();
  }

  Future<void> addAccount({
    required String nama,
    required double saldoAwal,
  }) async {
    await ref.read(accountsRepositoryProvider).createAccount(
          nama: nama,
          saldoAwal: saldoAwal,
        );
    _refreshAfterMutation();
  }

  Future<void> updateAccount({
    required String id,
    String? nama,
    bool? isActive,
  }) async {
    await ref.read(accountsRepositoryProvider).updateAccount(
          id: id,
          nama: nama,
          isActive: isActive,
        );
    _refreshAfterMutation();
  }

  Future<void> deleteAccount(String id) async {
    await ref.read(accountsRepositoryProvider).deleteAccount(id);
    _refreshAfterMutation();
  }

  void _refreshAfterMutation() {
    ref.invalidateSelf();
    ref.invalidate(wealthSummaryProvider);
  }
}
