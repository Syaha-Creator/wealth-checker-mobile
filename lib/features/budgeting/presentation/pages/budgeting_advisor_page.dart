import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
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
      appBar: AppBar(title: const Text('Budgeting Advisor')),
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
          padding: const EdgeInsets.all(16),
          children: [
            summaryAsync.when(
              data: (summary) => _WealthLevelHeader(summary: summary),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Rencana Pemasukan Bulanan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _incomeController,
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
                        const SizedBox(height: 12),
                        Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isSaving ? null : _save,
                        child: _isSaving
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Simpan Rencana'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AsyncValueWidget<BudgetingAdvice>(
              value: adviceAsync,
              onRetry: () => ref.invalidate(budgetingAdviceProvider),
              data: (advice) => _AdviceSection(advice: advice),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level kekayaan saat ini',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            WealthLevelBadge(
              wealthLevel: summary.wealthLevel,
              wealthLevelName: summary.wealthLevelName,
              large: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _AdviceSection extends StatelessWidget {
  const _AdviceSection({required this.advice});

  final BudgetingAdvice advice;

  @override
  Widget build(BuildContext context) {
    if (advice.wealthLevel < 0) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Lengkapi data keuangan Anda terlebih dahulu untuk mendapatkan '
            'rekomendasi alokasi anggaran.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    if (advice.alokasi.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Belum ada rekomendasi alokasi untuk level kekayaan Anda.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Rekomendasi Alokasi',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          advice.hasPlan
              ? 'Berdasarkan rencana ${formatRupiah(advice.rencanaPemasukanBulanan)}'
              : 'Simpan rencana pemasukan untuk melihat nominal per kategori. '
                  'Persentase di bawah mengikuti level kekayaan Anda.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        ...advice.alokasi.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _AllocationCard(allocation: item),
          ),
        ),
        if (advice.sisaTidakTeralokasi > 0) ...[
          const SizedBox(height: 8),
          Text(
            'Sisa tidak teralokasi: ${formatRupiah(advice.sisaTidakTeralokasi)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}

class _AllocationCard extends StatelessWidget {
  const _AllocationCard({required this.allocation});

  final BudgetAllocation allocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allocation.kategori,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${allocation.persen}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Text(
              formatRupiah(allocation.nominal),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
