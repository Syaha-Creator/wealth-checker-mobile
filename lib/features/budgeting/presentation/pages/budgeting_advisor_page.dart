import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/models/checklist_definitions.dart';
import '../../../../shared/widgets/persisted_checklist_section.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/wealth_level_badge.dart';
import '../../../dashboard/data/models/wealth_summary.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../data/budgeting_repository.dart';
import '../../data/models/budget_plan.dart';
import '../../data/models/budgeting_advice.dart';
import '../providers/budgeting_providers.dart';

class BudgetingAdvisorPage extends ConsumerStatefulWidget {
  const BudgetingAdvisorPage({super.key});

  @override
  ConsumerState<BudgetingAdvisorPage> createState() =>
      _BudgetingAdvisorPageState();
}

class _BudgetingAdvisorPageState extends ConsumerState<BudgetingAdvisorPage> {
  final _incomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _initializedFromPlan = false;
  bool _isSaving = false;
  String? _errorMessage;

  @override
  void dispose() {
    _incomeController.dispose();
    super.dispose();
  }

  void _prefillFromPlan(BudgetPlan? plan) {
    if (_initializedFromPlan || plan == null) {
      return;
    }
    _incomeController.text = plan.rencanaPemasukanBulanan.toString();
    _initializedFromPlan = true;
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final income = int.parse(_incomeController.text);
    setState(() {
      _errorMessage = null;
      _isSaving = true;
    });

    try {
      await ref.read(budgetingRepositoryProvider).createOrUpdateBudgetPlan(
            rencanaPemasukanBulanan: income,
          );
      ref.invalidate(currentBudgetPlanProvider);
      ref.invalidate(budgetingAdviceProvider);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rencana pemasukan berhasil disimpan')),
      );
    } on ApiException catch (error) {
      setState(() => _errorMessage = error.message);
    } catch (_) {
      setState(
        () => _errorMessage = 'Terjadi kesalahan. Silakan coba lagi.',
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final planAsync = ref.watch(currentBudgetPlanProvider);
    final adviceAsync = ref.watch(budgetingAdviceProvider);
    final summaryAsync = ref.watch(wealthSummaryProvider);

    planAsync.whenData(_prefillFromPlan);

    return Scaffold(
      backgroundColor: context.semanticColors.background,
      appBar: AppBar(
        title: const Text('Saran Budgeting'),
        backgroundColor: context.semanticColors.background,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(currentBudgetPlanProvider);
          ref.invalidate(budgetingAdviceProvider);
          await Future.wait([
            ref.read(currentBudgetPlanProvider.future),
            ref.read(budgetingAdviceProvider.future),
          ]);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            summaryAsync.when(
              data: (summary) => _WealthLevelHeader(summary: summary),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppCard.subtle(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Rencana Pemasukan Bulanan',
                      style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    TextFormField(
                      controller: _incomeController,
                      style: AppTextStyles.money(context.semanticColors.textPrimary),
                      decoration: const InputDecoration(
                        labelText: 'Nominal',
                        hintText: '0',
                        prefixText: 'Rp ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Wajib diisi';
                        }
                        final parsed = int.tryParse(value);
                        if (parsed == null || parsed <= 0) {
                          return 'Masukkan nominal lebih dari 0';
                        }
                        return null;
                      },
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        _errorMessage!,
                        style: AppTextStyles.bodySmall(context.semanticColors.danger),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    ElevatedButton(
                      onPressed: _isSaving ? null : _save,
                      child: _isSaving
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Simpan Rencana'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AsyncValueWidget<BudgetingAdvice>(
              value: adviceAsync,
              onRetry: () => ref.invalidate(budgetingAdviceProvider),
              data: (advice) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AdviceSection(advice: advice),
                  const SizedBox(height: AppSpacing.lg),
                  const PersistedChecklistSection(
                    title: 'Tips Budgeting',
                    category: BudgetingTipsChecklist.category,
                    definitions: BudgetingTipsChecklist.items,
                    style: PersistedChecklistStyle.appliedToggle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WealthLevelHeader extends StatelessWidget {
  const _WealthLevelHeader({required this.summary});

  final WealthSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Level kekayaan saat ini',
            style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.md),
          WealthLevelBadge(
            wealthLevel: summary.wealthLevel,
            wealthLevelName: summary.wealthLevelName,
            large: true,
          ),
        ],
      ),
    );
  }
}

class _AdviceSection extends StatelessWidget {
  const _AdviceSection({required this.advice});

  final BudgetingAdvice advice;

  static List<Color> _tintColors(AppSemanticColors colors) => [
    colors.accentBlueSoft,
    colors.brandSoft,
    colors.investPurpleSoft,
    colors.amberAccentSoft,
  ];

  static List<Color> _accentColors(AppSemanticColors colors) => [
    colors.accentBlue,
    colors.brand,
    colors.investPurple,
    colors.amberAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;
    final tintColors = _tintColors(colors);
    final accentColors = _accentColors(colors);
    if (advice.wealthLevel < 0) {
      return AppCard.subtle(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(
          'Lengkapi data keuangan Anda terlebih dahulu untuk mendapatkan '
          'rekomendasi alokasi anggaran.',
          style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
        ),
      );
    }

    if (advice.alokasi.isEmpty) {
      return AppCard.subtle(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(
          'Belum ada rekomendasi alokasi untuk level kekayaan Anda.',
          style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Rekomendasi Alokasi',
          style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          advice.hasPlan
              ? 'Berdasarkan rencana ${formatRupiah(advice.rencanaPemasukanBulanan)}'
              : 'Simpan rencana pemasukan untuk melihat nominal per kategori.',
          style: AppTextStyles.bodySmall(context.semanticColors.textMuted),
        ),
        const SizedBox(height: AppSpacing.md),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.semanticColors.accentBlueSoft,
            borderRadius: AppRadius.circular,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              'Alokasi di bawah bersifat rekomendasi berdasarkan level kekayaan. '
              'Gunakan "Simpan Rencana" di atas untuk menyimpan pemasukan bulanan.',
              style: AppTextStyles.bodySmall(context.semanticColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...advice.alokasi.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _AllocationCard(
              allocation: item,
              softColor: tintColors[index % tintColors.length],
              accentColor: accentColors[index % accentColors.length],
            ),
          );
        }),
        if (advice.sisaTidakTeralokasi > 0) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Sisa tidak teralokasi: ${formatRupiah(advice.sisaTidakTeralokasi)}',
            style: AppTextStyles.bodySmall(context.semanticColors.textMuted),
          ),
        ],
      ],
    );
  }
}

class _AllocationCard extends StatelessWidget {
  const _AllocationCard({
    required this.allocation,
    required this.softColor,
    required this.accentColor,
  });

  final BudgetAllocation allocation;
  final Color softColor;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: softColor,
        borderRadius: AppRadius.circular,
        boxShadow: AppShadows.shadowSm,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allocation.kategori,
                    style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${allocation.persen}%',
                    style: AppTextStyles.bodySmall(accentColor),
                  ),
                ],
              ),
            ),
            Text(
              formatRupiah(allocation.nominal),
              style: AppTextStyles.money(context.semanticColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
