import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/providers/auth_state_provider.dart';
import '../../../auth/data/auth_repository.dart';
import '../widgets/more_quick_action_sheets.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authRepositoryProvider).signOut();
    } catch (_) {
      // Local session is cleared even if the remote sign-out fails.
    }
    await ref.read(authStateProvider.notifier).setUnauthenticated();
    if (context.mounted) {
      context.go('/login');
    }
  }

  void _handleTap(BuildContext context, WidgetRef ref, _MoreMenuItem item) {
    switch (item.action) {
      case _MoreMenuAction.accounts:
        showAccountsQuickSheet(context);
      case _MoreMenuAction.debts:
        showDebtsQuickSheet(context);
      case _MoreMenuAction.receivables:
        showReceivablesQuickSheet(context);
      case _MoreMenuAction.assets:
        showAssetsQuickSheet(context);
      case _MoreMenuAction.healthCheckup:
        context.push('/health-checkup');
      case _MoreMenuAction.budgeting:
        context.push('/budgeting');
      case _MoreMenuAction.retirement:
        context.push('/retirement-plan');
      case _MoreMenuAction.profile:
        showProfileQuickSheet(
          context,
          ref,
          onLogout: () => _logout(context, ref),
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        title: const Text('Lainnya'),
        backgroundColor: AppColors.bgPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Kelola & Modul',
            style: AppTextStyles.headingMedium(AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.md),
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _MoreMenuTile(
                item: item,
                onTap: () => _handleTap(context, ref, item),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _MoreMenuAction {
  accounts,
  debts,
  receivables,
  assets,
  healthCheckup,
  budgeting,
  retirement,
  profile,
}

class _MoreMenuItem {
  const _MoreMenuItem({
    required this.key,
    required this.icon,
    required this.label,
    required this.action,
    required this.chipColor,
    required this.iconColor,
    this.subtitle,
  });

  final Key key;
  final IconData icon;
  final String label;
  final String? subtitle;
  final _MoreMenuAction action;
  final Color chipColor;
  final Color iconColor;
}

const _items = [
  _MoreMenuItem(
    key: Key('more_menu_accounts'),
    icon: Icons.account_balance_wallet_outlined,
    label: 'Kelola Rekening',
    action: _MoreMenuAction.accounts,
    chipColor: AppColors.bgBrandSoft,
    iconColor: AppColors.brandPrimary,
  ),
  _MoreMenuItem(
    key: Key('more_menu_debts'),
    icon: Icons.money_off_outlined,
    label: 'Kelola Utang',
    action: _MoreMenuAction.debts,
    chipColor: AppColors.dangerNewSoft,
    iconColor: AppColors.dangerPrimary,
  ),
  _MoreMenuItem(
    key: Key('more_menu_receivables'),
    icon: Icons.savings_outlined,
    label: 'Kelola Piutang',
    action: _MoreMenuAction.receivables,
    chipColor: AppColors.amberAccentSoft,
    iconColor: AppColors.amberAccent,
  ),
  _MoreMenuItem(
    key: Key('more_menu_assets'),
    icon: Icons.trending_up_outlined,
    label: 'Kelola Aset & Investasi',
    action: _MoreMenuAction.assets,
    chipColor: AppColors.investPurpleSoft,
    iconColor: AppColors.investPurple,
  ),
  _MoreMenuItem(
    key: Key('more_menu_health'),
    icon: Icons.health_and_safety_outlined,
    label: 'Cek Kesehatan Finansial',
    action: _MoreMenuAction.healthCheckup,
    chipColor: AppColors.accentBlueSoft,
    iconColor: AppColors.accentBlue,
  ),
  _MoreMenuItem(
    key: Key('more_menu_budgeting'),
    icon: Icons.pie_chart_outline,
    label: 'Saran Budgeting',
    action: _MoreMenuAction.budgeting,
    chipColor: AppColors.accentBlueSoft,
    iconColor: AppColors.accentBlue,
  ),
  _MoreMenuItem(
    key: Key('more_menu_retirement'),
    icon: Icons.elderly_outlined,
    label: 'Rencana Pensiun & Warisan',
    action: _MoreMenuAction.retirement,
    chipColor: AppColors.investPurpleSoft,
    iconColor: AppColors.investPurple,
  ),
  _MoreMenuItem(
    key: Key('more_menu_profile'),
    icon: Icons.person_outline,
    label: 'Profil & Pengaturan',
    action: _MoreMenuAction.profile,
    chipColor: AppColors.backgroundSubtle,
    iconColor: AppColors.textSecondary,
  ),
];

class _MoreMenuTile extends StatelessWidget {
  const _MoreMenuTile({
    required this.item,
    required this.onTap,
  });

  final _MoreMenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      key: item.key,
      onTap: onTap,
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
              color: item.chipColor,
              borderRadius: AppRadius.circular,
            ),
            child: Icon(item.icon, color: item.iconColor, size: AppSpacing.xl),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: AppTextStyles.bodyLarge(AppColors.textPrimary),
                ),
                if (item.subtitle != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    item.subtitle!,
                    style: AppTextStyles.bodySmall(AppColors.textMuted),
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
