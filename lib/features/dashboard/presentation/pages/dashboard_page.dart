import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/data/auth_repository.dart';
import '../../../../shared/providers/auth_state_provider.dart';
import '../../../../shared/widgets/wealth_level_badge.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/monthly_cash_flow.dart';
import '../../data/models/wealth_summary.dart';
import '../providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../transactions/presentation/widgets/transaction_quick_add_sheet.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  Future<void> _logout(WidgetRef ref) async {
    try {
      await ref.read(authRepositoryProvider).signOut();
    } catch (_) {
      // Local session is cleared even if the remote sign-out fails.
    }
    await ref.read(authStateProvider.notifier).setUnauthenticated();
  }

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(wealthSummaryProvider);
    ref.invalidate(emergencyFundProvider);
    ref.invalidate(monthlyCashFlowProvider);
    await Future.wait([
      ref.read(wealthSummaryProvider.future),
      ref.read(monthlyCashFlowProvider.future),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wealthSummaryAsync = ref.watch(wealthSummaryProvider);
    final monthlyCashFlowAsync = ref.watch(monthlyCashFlowProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wealth Checker'),
        actions: [
          IconButton(
            onPressed: () => _logout(ref),
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTransactionQuickAddSheet(context),
        tooltip: 'Catat transaksi',
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(ref),
        child: AsyncValueWidget<WealthSummary>(
          value: wealthSummaryAsync,
          onRetry: () {
            ref.invalidate(wealthSummaryProvider);
            ref.invalidate(emergencyFundProvider);
          },
          data: (summary) {
            if (summary.needsOnboarding) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  EmptyStateWidget(
                    title: 'Kamu belum menyelesaikan onboarding',
                    message:
                        'Lengkapi data keuangan awal untuk melihat ringkasan kekayaan dan level keuanganmu.',
                    icon: Icons.assignment_outlined,
                    action: OutlinedButton(
                      onPressed: () => context.go('/onboarding'),
                      child: const Text('Mulai onboarding'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _MonthlyCashFlowSection(
                    value: monthlyCashFlowAsync,
                    onRetry: () => ref.invalidate(monthlyCashFlowProvider),
                  ),
                ],
              );
            }

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                _NetWorthCard(summary: summary),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () => context.push('/accounts'),
                  icon: const Icon(Icons.account_balance_wallet_outlined),
                  label: const Text('Kelola Rekening'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/transactions'),
                  icon: const Icon(Icons.receipt_long_outlined),
                  label: const Text('Lihat Semua Transaksi'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/debts'),
                  icon: const Icon(Icons.money_off_outlined),
                  label: const Text('Kelola Utang'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/receivables'),
                  icon: const Icon(Icons.savings_outlined),
                  label: const Text('Kelola Piutang'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/assets/liquid'),
                  icon: const Icon(Icons.trending_up_outlined),
                  label: const Text('Kelola Investasi'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/assets/fixed'),
                  icon: const Icon(Icons.inventory_2_outlined),
                  label: const Text('Kelola Aset Tetap'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Wawasan Finansial',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/health-checkup'),
                  icon: const Icon(Icons.health_and_safety_outlined),
                  label: const Text('Health Check-up'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/budgeting'),
                  icon: const Icon(Icons.pie_chart_outline),
                  label: const Text('Budgeting Advisor'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.push('/analytics'),
                  icon: const Icon(Icons.analytics_outlined),
                  label: const Text('Analisa Keuangan'),
                ),
                const SizedBox(height: 16),
                _BreakdownSection(summary: summary),
                const SizedBox(height: 24),
                _MonthlyCashFlowSection(
                  value: monthlyCashFlowAsync,
                  onRetry: () => ref.invalidate(monthlyCashFlowProvider),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NetWorthCard extends StatelessWidget {
  const _NetWorthCard({
    required this.summary,
  });

  final WealthSummary summary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kekayaan Bersih',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              formatRupiah(summary.kekayaanBersih),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            WealthLevelBadge(
              wealthLevel: summary.wealthLevel,
              wealthLevelName: summary.wealthLevelName,
            ),
            const SizedBox(height: 12),
            Text(
              summary.userName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _BreakdownSection extends StatelessWidget {
  const _BreakdownSection({required this.summary});

  final WealthSummary summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Breakdown',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        _BreakdownTile(
          label: 'Uang',
          subtitle: 'Kas, aset likuid, dan piutang',
          amount: summary.totalUang,
          icon: Icons.payments_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 8),
        _BreakdownTile(
          label: 'Barang',
          subtitle: 'Aset tetap',
          amount: summary.totalBarang,
          icon: Icons.home_work_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(height: 8),
        _BreakdownTile(
          label: 'Utang',
          subtitle: 'Total kewajiban',
          amount: summary.totalUtang,
          icon: Icons.credit_card_outlined,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 8),
        _BreakdownTile(
          label: 'Total Aset',
          subtitle: 'Sebelum dikurangi utang',
          amount: summary.totalAset,
          icon: Icons.account_balance_wallet_outlined,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ],
    );
  }
}

class _BreakdownTile extends StatelessWidget {
  const _BreakdownTile({
    required this.label,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.color,
  });

  final String label;
  final String subtitle;
  final int amount;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(label),
        subtitle: Text(subtitle),
        trailing: Text(
          formatRupiah(amount),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _MonthlyCashFlowSection extends StatelessWidget {
  const _MonthlyCashFlowSection({
    required this.value,
    required this.onRetry,
  });

  final AsyncValue<MonthlyCashFlow> value;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sisa Uang Bulanan',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        AsyncValueWidget<MonthlyCashFlow>(
          value: value,
          onRetry: onRetry,
          data: (cashFlow) => _MonthlyCashFlowCard(cashFlow: cashFlow),
        ),
      ],
    );
  }
}

class _MonthlyCashFlowCard extends StatelessWidget {
  const _MonthlyCashFlowCard({required this.cashFlow});

  final MonthlyCashFlow cashFlow;

  @override
  Widget build(BuildContext context) {
    final current = cashFlow.bulanIni;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatMonthLabel(current.bulan),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 16),
            _CashFlowRow(
              label: 'Pemasukan',
              amount: current.pemasukan,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            _CashFlowRow(
              label: 'Pengeluaran',
              amount: current.pengeluaran,
              color: Theme.of(context).colorScheme.error,
            ),
            const Divider(height: 24),
            _CashFlowRow(
              label: 'Sisa uang bulanan',
              amount: current.sisaUangBulanan,
              color: Theme.of(context).colorScheme.onSurface,
              emphasize: true,
            ),
            const SizedBox(height: 16),
            Text(
              'Rata-rata 3 bulan: ${formatRupiah(cashFlow.rataRata3Bulan.sisaUangBulanan)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (cashFlow.hidupTanpaGajiBulan != null) ...[
              const SizedBox(height: 4),
              Text(
                'Estimasi hidup tanpa gaji: ${cashFlow.hidupTanpaGajiBulan!.toStringAsFixed(1)} bulan',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (cashFlow.usedProfileFallback) ...[
              const SizedBox(height: 12),
              Text(
                'Menggunakan data rencana dari profil karena belum ada transaksi.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CashFlowRow extends StatelessWidget {
  const _CashFlowRow({
    required this.label,
    required this.amount,
    required this.color,
    this.emphasize = false,
  });

  final String label;
  final int amount;
  final Color color;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final textStyle = emphasize
        ? Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            )
        : Theme.of(context).textTheme.bodyLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          formatRupiah(amount),
          style: textStyle,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
