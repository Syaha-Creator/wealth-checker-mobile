import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/providers/auth_state_provider.dart';
import '../../../auth/data/auth_repository.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lainnya')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Kelola & Modul',
            style: AppTextStyles.headingMedium(
              Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _MoreMenuTile(item: item),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppCard.subtle(
            onTap: () => _logout(context, ref),
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Icon(Icons.logout, color: AppColors.dangerPrimary),
                const SizedBox(width: AppSpacing.md),
                Text(
                  'Keluar',
                  style: AppTextStyles.bodyLarge(AppColors.dangerPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
}

class _MoreMenuItem {
  const _MoreMenuItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.chipColor,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String route;
  final Color chipColor;
  final Color iconColor;
}

const _items = [
  _MoreMenuItem(
    icon: Icons.account_balance_wallet_outlined,
    label: 'Kelola Rekening',
    route: '/accounts',
    chipColor: AppColors.bgBrandSoft,
    iconColor: AppColors.brandPrimary,
  ),
  _MoreMenuItem(
    icon: Icons.money_off_outlined,
    label: 'Kelola Utang',
    route: '/debts',
    chipColor: AppColors.dangerNewSoft,
    iconColor: AppColors.dangerPrimary,
  ),
  _MoreMenuItem(
    icon: Icons.savings_outlined,
    label: 'Kelola Piutang',
    route: '/receivables',
    chipColor: AppColors.amberAccentSoft,
    iconColor: AppColors.amberAccent,
  ),
  _MoreMenuItem(
    icon: Icons.trending_up_outlined,
    label: 'Kelola Investasi',
    route: '/assets/liquid',
    chipColor: AppColors.investPurpleSoft,
    iconColor: AppColors.investPurple,
  ),
  _MoreMenuItem(
    icon: Icons.inventory_2_outlined,
    label: 'Kelola Aset Tetap',
    route: '/assets/fixed',
    chipColor: AppColors.accentBlueSoft,
    iconColor: AppColors.accentBlue,
  ),
  _MoreMenuItem(
    icon: Icons.pie_chart_outline,
    label: 'Saran Budgeting',
    route: '/budgeting',
    chipColor: AppColors.accentBlueSoft,
    iconColor: AppColors.accentBlue,
  ),
  _MoreMenuItem(
    icon: Icons.health_and_safety_outlined,
    label: 'Cek Kesehatan Finansial',
    route: '/health-checkup',
    chipColor: AppColors.bgBrandSoft,
    iconColor: AppColors.brandPrimary,
  ),
  _MoreMenuItem(
    icon: Icons.elderly_outlined,
    label: 'Rencana Pensiun',
    route: '/retirement-plan',
    chipColor: AppColors.investPurpleSoft,
    iconColor: AppColors.investPurple,
  ),
];

class _MoreMenuTile extends StatelessWidget {
  const _MoreMenuTile({required this.item});

  final _MoreMenuItem item;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      onTap: () => context.push(item.route),
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
            child: Text(
              item.label,
              style: AppTextStyles.bodyLarge(
                Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}
