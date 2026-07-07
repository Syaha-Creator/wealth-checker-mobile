import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/budgeting_repository.dart';
import '../../data/models/budget_plan.dart';
import '../../data/models/budgeting_advice.dart';

part 'budgeting_providers.g.dart';

@riverpod
Future<BudgetPlan?> currentBudgetPlan(Ref ref) {
  final bulanTahun = ref.read(budgetingRepositoryProvider).currentBulanTahun();
  return ref
      .read(budgetingRepositoryProvider)
      .getCurrentBudgetPlan(bulanTahun: bulanTahun);
}

@riverpod
Future<BudgetingAdvice> budgetingAdvice(Ref ref) {
  final bulanTahun = ref.read(budgetingRepositoryProvider).currentBulanTahun();
  return ref
      .read(budgetingRepositoryProvider)
      .getBudgetingAdvice(bulanTahun: bulanTahun);
}
