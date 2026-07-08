import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/providers/theme_mode_provider.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';
import '../../../assets/data/models/fixed_asset_holding.dart';
import '../../../assets/data/models/liquid_asset_holding.dart';
import '../../../assets/presentation/providers/fixed_asset_holdings_provider.dart';
import '../../../assets/presentation/providers/liquid_asset_holdings_provider.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../debts_receivables/data/models/debt.dart';
import '../../../debts_receivables/data/models/receivable.dart';
import '../../../debts_receivables/presentation/providers/debts_list_provider.dart';
import '../../../debts_receivables/presentation/providers/receivables_list_provider.dart';

Future<void> showAccountsQuickSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.semanticColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.value)),
    ),
    builder: (context) => const _AccountsQuickSheet(),
  );
}

Future<void> showDebtsQuickSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.semanticColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.value)),
    ),
    builder: (context) => const _DebtsQuickSheet(),
  );
}

Future<void> showReceivablesQuickSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.semanticColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.value)),
    ),
    builder: (context) => const _ReceivablesQuickSheet(),
  );
}

Future<void> showAssetsQuickSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.semanticColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.value)),
    ),
    builder: (context) => const _AssetsQuickSheet(),
  );
}

Future<void> showProfileQuickSheet(
  BuildContext context,
  WidgetRef ref, {
  required Future<void> Function() onLogout,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.semanticColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.value)),
    ),
    builder: (context) => _ProfileQuickSheet(onLogout: onLogout),
  );
}

class _SheetScaffold extends StatelessWidget {
  const _SheetScaffold({
    required this.title,
    required this.child,
    this.footer,
  });

  final String title;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.72,
          minChildSize: 0.4,
          maxChildSize: 0.92,
          builder: (context, scrollController) {
            return Column(
              children: [
                const SizedBox(height: AppSpacing.sm),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.semanticColors.border,
                    borderRadius: AppRadius.circular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.headingSmall(
                            context.semanticColors.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      0,
                      AppSpacing.lg,
                      AppSpacing.lg,
                    ),
                    children: [child],
                  ),
                ),
                if (footer != null)
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: footer,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AccountsQuickSheet extends ConsumerWidget {
  const _AccountsQuickSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsListProvider);

    return _SheetScaffold(
      title: 'Kelola Rekening',
      child: AsyncValueWidget<List<Account>>(
        value: accountsAsync,
        onRetry: () => ref.invalidate(accountsListProvider),
        data: (accounts) {
          if (accounts.isEmpty) {
            return Text(
              'Belum ada rekening. Tambahkan rekening pertama Anda.',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            );
          }

          return Column(
            children: accounts
                .map(
                  (account) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AppCard.subtle(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  account.nama,
                                  style: AppTextStyles.headingSmall(
                                    context.semanticColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  formatRupiah(account.saldoCache),
                                  style: AppTextStyles.money(
                                    context.semanticColors.brand,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!account.isActive)
                            Text(
                              'Nonaktif',
                              style: AppTextStyles.labelMedium(
                                context.semanticColors.textMuted,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
      footer: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
            context.push('/accounts/new');
          },
          icon: const Icon(Icons.add),
          label: const Text('Tambah Rekening'),
        ),
      ),
    );
  }
}

class _DebtsQuickSheet extends ConsumerWidget {
  const _DebtsQuickSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtsAsync = ref.watch(debtsListProvider);

    return _SheetScaffold(
      title: 'Kelola Utang',
      child: AsyncValueWidget<List<Debt>>(
        value: debtsAsync,
        onRetry: () => ref.invalidate(debtsListProvider),
        data: (debts) {
          if (debts.isEmpty) {
            return Text(
              'Tidak ada utang aktif.',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            );
          }

          return Column(
            children: debts.map((debt) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: AppCard.subtle(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  color: context.semanticColors.dangerSoft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        debt.pemberiUtang,
                        style: AppTextStyles.headingSmall(
                          context.semanticColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Sisa ${formatRupiah(debt.sisaSaldo)} dari '
                        '${formatRupiah(debt.saldoAwal)}',
                        style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ClipRRect(
                        borderRadius: AppRadius.circular,
                        child: LinearProgressIndicator(
                          value: debt.repaymentProgress,
                          minHeight: 6,
                          color: context.semanticColors.danger,
                          backgroundColor: AppColors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          key: Key('bayar_utang_${debt.id}'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.push(
                              '/transactions/new?type=bayar_utang&relatedDebtId=${debt.id}',
                            );
                          },
                          child: const Text('Bayar Sebagian'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _ReceivablesQuickSheet extends ConsumerWidget {
  const _ReceivablesQuickSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivablesAsync = ref.watch(receivablesListProvider);

    return _SheetScaffold(
      title: 'Kelola Piutang',
      child: AsyncValueWidget<List<Receivable>>(
        value: receivablesAsync,
        onRetry: () => ref.invalidate(receivablesListProvider),
        data: (receivables) {
          if (receivables.isEmpty) {
            return Text(
              'Tidak ada piutang aktif.',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            );
          }

          return Column(
            children: receivables.map((receivable) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: AppCard.subtle(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  color: context.semanticColors.amberAccentSoft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        receivable.peminjam,
                        style: AppTextStyles.headingSmall(
                          context.semanticColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Sisa ${formatRupiah(receivable.sisaSaldo)} dari '
                        '${formatRupiah(receivable.saldoAwal)}',
                        style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ClipRRect(
                        borderRadius: AppRadius.circular,
                        child: LinearProgressIndicator(
                          value: receivable.collectionProgress,
                          minHeight: 6,
                          color: context.semanticColors.amberAccent,
                          backgroundColor: AppColors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.push(
                              '/transactions/new?type=penerimaan_piutang&relatedReceivableId=${receivable.id}',
                            );
                          },
                          child: const Text('Tandai Lunas'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _AssetsQuickSheet extends ConsumerWidget {
  const _AssetsQuickSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liquidAsync = ref.watch(liquidAssetHoldingsProvider);
    final fixedAsync = ref.watch(fixedAssetHoldingsProvider);

    return _SheetScaffold(
      title: 'Kelola Aset & Investasi',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Investasi Likuid',
            style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.sm),
          AsyncValueWidget<List<LiquidAssetHolding>>(
            value: liquidAsync,
            onRetry: () => ref.invalidate(liquidAssetHoldingsProvider),
            data: (holdings) => _buildHoldingsList(
              context,
              holdings
                  .where((item) => item.isActive)
                  .map((item) => (item.namaAset, item.totalNilai))
                  .toList(),
              emptyLabel: 'Belum ada investasi likuid.',
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Aset Tetap',
            style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.sm),
          AsyncValueWidget<List<FixedAssetHolding>>(
            value: fixedAsync,
            onRetry: () => ref.invalidate(fixedAssetHoldingsProvider),
            data: (holdings) => _buildHoldingsList(
              context,
              holdings
                  .where((item) => item.isActive)
                  .map((item) => (item.namaAset, item.totalNilai))
                  .toList(),
              emptyLabel: 'Belum ada aset tetap.',
            ),
          ),
        ],
      ),
      footer: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/transactions/new?type=beli_investasi');
              },
              icon: const Icon(Icons.trending_up),
              label: const Text('Tambah Investasi'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/transactions/new?type=beli_barang');
              },
              icon: const Icon(Icons.inventory_2_outlined),
              label: const Text('Tambah Aset'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoldingsList(
    BuildContext context,
    List<(String name, double value)> items, {
    required String emptyLabel,
  }) {
    if (items.isEmpty) {
      return Text(
        emptyLabel,
        style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
      );
    }

    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: AppCard.subtle(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.$1,
                        style: AppTextStyles.bodyLarge(context.semanticColors.textPrimary),
                      ),
                    ),
                    Text(
                      formatRupiah(item.$2.round()),
                      style: AppTextStyles.money(context.semanticColors.investPurple),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProfileQuickSheet extends ConsumerWidget {
  const _ProfileQuickSheet({required this.onLogout});

  final Future<void> Function() onLogout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(wealthSummaryProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return _SheetScaffold(
      title: 'Profil & Pengaturan',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SectionLabel('Edit Profil'),
          const SizedBox(height: AppSpacing.sm),
          summaryAsync.when(
            data: (summary) => AppCard.subtle(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    initialValue: summary.userName,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: 'Nama'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    initialValue: summary.userEmail,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Fitur akan segera hadir',
                    style: AppTextStyles.bodySmall(context.semanticColors.textMuted),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text('Simpan Profil'),
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Text(
              'Gagal memuat profil.',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionLabel('Notifikasi'),
          const SizedBox(height: AppSpacing.sm),
          _DisabledToggleTile(
            label: 'Transaksi Baru',
            subtitle: 'Segera Hadir',
          ),
          _DisabledToggleTile(
            label: 'Peringatan Anggaran',
            subtitle: 'Segera Hadir',
          ),
          _DisabledToggleTile(
            label: 'Progres Impian',
            subtitle: 'Segera Hadir',
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionLabel('Keamanan'),
          const SizedBox(height: AppSpacing.sm),
          _DisabledToggleTile(
            label: 'Face ID',
            subtitle: 'Segera Hadir',
          ),
          _DisabledToggleTile(
            label: 'Verifikasi 2 Langkah',
            subtitle: 'Segera Hadir',
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionLabel('Tampilan'),
          const SizedBox(height: AppSpacing.sm),
          AppCard.subtle(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Mode Gelap',
                style: AppTextStyles.bodyLarge(context.semanticColors.textPrimary),
              ),
              value: isDark,
              onChanged: (_) =>
                  ref.read(appThemeModeProvider.notifier).toggle(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                Navigator.of(context).pop();
                await onLogout();
              },
              icon: Icon(Icons.logout, color: context.semanticColors.danger),
              label: Text(
                'Keluar',
                style: AppTextStyles.bodyLarge(context.semanticColors.danger),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.labelMedium(context.semanticColors.textMuted),
    );
  }
}

class _DisabledToggleTile extends StatelessWidget {
  const _DisabledToggleTile({
    required this.label,
    required this.subtitle,
  });

  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          label,
          style: AppTextStyles.bodyMedium(context.semanticColors.textMuted),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodySmall(context.semanticColors.textMuted),
        ),
        value: false,
        onChanged: null,
      ),
    );
  }
}
