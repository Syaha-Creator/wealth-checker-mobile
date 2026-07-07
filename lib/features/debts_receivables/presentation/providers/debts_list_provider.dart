import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../data/debts_repository.dart';
import '../../data/models/debt.dart';

part 'debts_list_provider.g.dart';

@riverpod
class DebtsList extends _$DebtsList {
  @override
  Future<List<Debt>> build() async {
    final debts = await ref.read(debtsRepositoryProvider).getDebts();
    return debts
        .where(
          (debt) =>
              debt.tipe == DebtType.utangBiasa && debt.sisaSaldo > 0,
        )
        .toList();
  }

  Future<void> addDebt({
    required String pemberiUtang,
    required double saldoAwal,
  }) async {
    await ref.read(debtsRepositoryProvider).createDebt(
          pemberiUtang: pemberiUtang,
          tipe: 'utang_biasa',
          saldoAwal: saldoAwal,
        );
    _refreshAfterMutation();
  }

  Future<void> updateDebt({
    required String id,
    String? pemberiUtang,
  }) async {
    await ref.read(debtsRepositoryProvider).updateDebt(
          id: id,
          pemberiUtang: pemberiUtang,
        );
    _refreshAfterMutation();
  }

  Future<void> deleteDebt(String id) async {
    await ref.read(debtsRepositoryProvider).deleteDebt(id);
    _refreshAfterMutation();
  }

  void _refreshAfterMutation() {
    ref.invalidateSelf();
    ref.invalidate(wealthSummaryProvider);
    ref.invalidate(emergencyFundProvider);
  }
}

/// All active debts (including kartu kredit) for transaction linking.
@riverpod
Future<List<Debt>> allActiveDebts(Ref ref) async {
  final debts = await ref.watch(debtsRepositoryProvider).getDebts();
  return debts.where((debt) => debt.sisaSaldo > 0).toList();
}
