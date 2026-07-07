import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../data/debts_repository.dart';
import '../../data/models/receivable.dart';

part 'receivables_list_provider.g.dart';

@riverpod
class ReceivablesList extends _$ReceivablesList {
  @override
  Future<List<Receivable>> build() async {
    final receivables =
        await ref.read(debtsRepositoryProvider).getReceivables();
    return receivables.where((item) => item.sisaSaldo > 0).toList();
  }

  Future<void> addReceivable({
    required String peminjam,
    required double saldoAwal,
  }) async {
    await ref.read(debtsRepositoryProvider).createReceivable(
          peminjam: peminjam,
          saldoAwal: saldoAwal,
        );
    _refreshAfterMutation();
  }

  Future<void> updateReceivable({
    required String id,
    String? peminjam,
  }) async {
    await ref.read(debtsRepositoryProvider).updateReceivable(
          id: id,
          peminjam: peminjam,
        );
    _refreshAfterMutation();
  }

  Future<void> deleteReceivable(String id) async {
    await ref.read(debtsRepositoryProvider).deleteReceivable(id);
    _refreshAfterMutation();
  }

  void _refreshAfterMutation() {
    ref.invalidateSelf();
    ref.invalidate(wealthSummaryProvider);
    ref.invalidate(emergencyFundProvider);
  }
}
