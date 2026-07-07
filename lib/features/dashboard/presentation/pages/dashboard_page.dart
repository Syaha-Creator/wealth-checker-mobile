import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/providers/theme_mode_provider.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/utils/greeting_utils.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/level_ring_progress.dart';
import '../../../../shared/widgets/net_worth_trend_chart.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../data/models/wealth_history_point.dart';
import '../../data/models/wealth_summary.dart';
import '../providers/dashboard_providers.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(wealthSummaryProvider);
    ref.invalidate(wealthHistoryProvider);
    ref.invalidate(accountsListProvider);
    await Future.wait([
      ref.read(wealthSummaryProvider.future),
      ref.read(wealthHistoryProvider.future),
      ref.read(accountsListProvider.future),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(wealthSummaryProvider);
    final historyAsync = ref.watch(wealthHistoryProvider);
    final accountsAsync = ref.watch(accountsListProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refresh(ref),
          child: AsyncValueWidget<WealthSummary>(
            value: summaryAsync,
            onRetry: () {
              ref.invalidate(wealthSummaryProvider);
            },
            data: (summary) {
              if (summary.needsOnboarding) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  children: [
                    _BerandaHeader(
                      userName: summary.userName,
                      isDark: isDark,
                      onToggleTheme: () =>
                          ref.read(appThemeModeProvider.notifier).toggle(),
                    ),
                    const SizedBox(height: AppSpacing.xl),
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
                  ],
                );
              }

              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  AppSpacing.xl,
                ),
                children: [
                  _BerandaHeader(
                    userName: summary.userName,
                    isDark: isDark,
                    onToggleTheme: () =>
                        ref.read(appThemeModeProvider.notifier).toggle(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _NetWorthHeroCard(
                    summary: summary,
                    historyAsync: historyAsync,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: _StatMiniCard(
                          label: 'Total Aset',
                          amount: summary.totalAset,
                          amountColor: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _StatMiniCard(
                          label: 'Total Utang',
                          amount: summary.totalUtang,
                          amountColor: AppColors.dangerPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _LevelProgressCard(summary: summary),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    'Rincian Akun',
                    style: AppTextStyles.headingMedium(
                      Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AsyncValueWidget<List<Account>>(
                    value: accountsAsync,
                    onRetry: () => ref.invalidate(accountsListProvider),
                    data: (accounts) => _AccountsSection(accounts: accounts),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BerandaHeader extends StatelessWidget {
  const _BerandaHeader({
    required this.userName,
    required this.isDark,
    required this.onToggleTheme,
  });

  final String userName;
  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final greeting = greetingForNow();
    final displayName = userName.trim().isEmpty ? 'Pengguna' : userName.trim();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: AppTextStyles.bodyMedium(AppColors.textMuted),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                displayName,
                style: AppTextStyles.headingMedium(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: AppColors.backgroundSubtle,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onToggleTheme,
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                color: AppColors.textSecondary,
                size: AppSpacing.xl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NetWorthHeroCard extends StatelessWidget {
  const _NetWorthHeroCard({
    required this.summary,
    required this.historyAsync,
  });

  final WealthSummary summary;
  final AsyncValue<WealthHistory> historyAsync;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final history = historyAsync.maybeWhen(data: (value) => value, orElse: () => null);

    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kekayaan Bersih (Net Worth)',
            style: AppTextStyles.bodySmall(AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            formatRupiah(summary.kekayaanBersih),
            style: AppTextStyles.heroNumberCompact(onSurface),
          ),
          if (history != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _NetWorthDeltaRow(history: history),
            const SizedBox(height: AppSpacing.md),
            NetWorthTrendChart(history: history),
          ] else if (historyAsync.isLoading) ...[
            const SizedBox(height: AppSpacing.lg),
            const Center(
              child: SizedBox(
                width: AppSpacing.xl,
                height: AppSpacing.xl,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _NetWorthDeltaRow extends StatelessWidget {
  const _NetWorthDeltaRow({required this.history});

  final WealthHistory history;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final delta = history.delta;
    final isPositive = delta >= 0;
    final accentColor =
        isDark ? AppColors.accentBlueDark : AppColors.accentBlue;
    final color = isPositive ? accentColor : AppColors.dangerPrimary;
    final arrow = isPositive ? '▲' : '▼';

    final percent = _deltaPercent(history);
    final percentLabel = percent == null
        ? ''
        : '${percent.abs().toStringAsFixed(1)}%  ';

    final deltaLabel = delta >= 0
        ? '+${formatRupiah(delta)}'
        : '-${formatRupiah(delta.abs())}';

    return Text(
      '$arrow $percentLabel$deltaLabel bulan ini',
      style: AppTextStyles.bodySmall(color).copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  double? _deltaPercent(WealthHistory history) {
    if (!history.hasEnoughPoints) {
      return null;
    }
    final baseline = history.history.first.kekayaanBersih;
    if (baseline == 0) {
      return null;
    }
    return history.delta / baseline * 100;
  }
}

class _StatMiniCard extends StatelessWidget {
  const _StatMiniCard({
    required this.label,
    required this.amount,
    required this.amountColor,
  });

  final String label;
  final int amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall(AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            formatRupiah(amount),
            style: AppTextStyles.money(amountColor),
          ),
        ],
      ),
    );
  }
}

class _LevelProgressCard extends StatelessWidget {
  const _LevelProgressCard({required this.summary});

  final WealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final level = summary.wealthLevel;
    final progress = levelRingProgress(level);
    final percent = levelProgressPercent(level);
    final nextLevel = level >= 6 ? level : level + 1;
    final subtitle = level < 0
        ? 'Lengkapi data untuk melihat level'
        : level >= 6
            ? 'Level maksimum tercapai'
            : '$percent% menuju Level $nextLevel';
    final levelLabel = level < 0 || summary.wealthLevelName.isEmpty
        ? 'Belum ada level'
        : 'Level $level · ${summary.wealthLevelName}';

    return AppCard.subtle(
      onTap: () => context.push('/health-checkup'),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          LevelRingProgress(
            level: level < 0 ? 0 : level,
            progress: progress,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  levelLabel,
                  style: AppTextStyles.headingSmall(
                    Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall(AppColors.textMuted),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _AccountsSection extends StatelessWidget {
  const _AccountsSection({required this.accounts});

  final List<Account> accounts;

  static const _chipPalette = [
    (AppColors.bgBrandSoft, AppColors.brandPrimary),
    (AppColors.investPurpleSoft, AppColors.investPurple),
    (AppColors.accentBlueSoft, AppColors.accentBlue),
    (AppColors.amberAccentSoft, AppColors.amberAccent),
  ];

  @override
  Widget build(BuildContext context) {
    final activeAccounts = accounts.where((account) => account.isActive).toList();

    if (activeAccounts.isEmpty) {
      return AppCard.subtle(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(
          'Belum ada rekening aktif.',
          style: AppTextStyles.bodyMedium(AppColors.textMuted),
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < activeAccounts.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.sm),
          _AccountRow(
            account: activeAccounts[i],
            chipColor: _chipPalette[i % _chipPalette.length].$1,
            iconColor: _chipPalette[i % _chipPalette.length].$2,
          ),
        ],
      ],
    );
  }
}

class _AccountRow extends StatelessWidget {
  const _AccountRow({
    required this.account,
    required this.chipColor,
    required this.iconColor,
  });

  final Account account;
  final Color chipColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final created = DateTime.tryParse(account.createdAt);
    final subLabel = created == null
        ? 'Saldo ${formatRupiah(account.saldoCache)}'
        : 'Dibuat ${DateFormat('dd MMM yyyy', 'id_ID').format(created.toLocal())}';

    return AppCard.subtle(
      onTap: () => context.push('/accounts'),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: chipColor,
              borderRadius: AppRadius.circular,
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: iconColor,
              size: AppSpacing.xl,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.nama,
                  style: AppTextStyles.bodyLarge(
                    Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  subLabel,
                  style: AppTextStyles.bodySmall(AppColors.textMuted),
                ),
              ],
            ),
          ),
          Text(
            formatRupiah(account.saldoCache),
            style: AppTextStyles.money(
              Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
