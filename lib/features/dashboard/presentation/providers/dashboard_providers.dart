import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/dashboard_repository.dart';
import '../../data/models/monthly_cash_flow.dart';
import '../../data/models/wealth_summary.dart';

part 'dashboard_providers.g.dart';

@riverpod
Future<WealthSummary> wealthSummary(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getWealthSummary();
}

@riverpod
Future<MonthlyCashFlow> monthlyCashFlow(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getMonthlyCashFlow();
}
