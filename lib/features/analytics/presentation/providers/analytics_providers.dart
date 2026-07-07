import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/providers/analytics_date_filter_provider.dart';
import '../../../analytics/data/analytics_repository.dart';
import '../../../analytics/data/models/budget_vs_actual.dart';
import '../../../analytics/data/models/emergency_fund.dart';
import '../../../analytics/data/models/essential_expenses.dart';
import '../../../analytics/data/models/income_report.dart';
import '../../../analytics/data/models/monthly_profit_loss.dart';
import '../../../dashboard/data/dashboard_repository.dart';
import '../../../dashboard/data/models/wealth_history_point.dart';

part 'analytics_providers.g.dart';

@riverpod
Future<WealthHistory> wealthHistory(Ref ref) {
  final range = ref.watch(analyticsDateFilterProvider);
  return ref.watch(dashboardRepositoryProvider).getWealthHistory(
        from: range.from,
        to: range.to,
      );
}

@riverpod
Future<List<MonthlyProfitLoss>> monthlyPl(Ref ref) {
  final range = ref.watch(analyticsDateFilterProvider);
  return ref.watch(analyticsRepositoryProvider).getMonthlyPl(
        from: range.from,
        to: range.to,
      );
}

@riverpod
Future<BudgetVsActual> budgetVsActual(Ref ref) {
  final range = ref.watch(analyticsDateFilterProvider);
  return ref.watch(analyticsRepositoryProvider).getBudgetVsActual(
        from: range.from,
        to: range.to,
      );
}

/// Reflects the user's current state — deliberately does NOT watch the
/// analytics date filter. Invalidate manually after mutations if needed.
@riverpod
Future<EmergencyFund> emergencyFund(Ref ref) {
  return ref.watch(analyticsRepositoryProvider).getEmergencyFund();
}

@riverpod
Future<EssentialExpenses> essentialExpenses(Ref ref) {
  final range = ref.watch(analyticsDateFilterProvider);
  return ref.watch(analyticsRepositoryProvider).getEssentialExpenses(
        from: range.from,
        to: range.to,
      );
}

@riverpod
Future<IncomeReport> income(Ref ref) {
  final range = ref.watch(analyticsDateFilterProvider);
  return ref.watch(analyticsRepositoryProvider).getIncome(
        from: range.from,
        to: range.to,
      );
}
