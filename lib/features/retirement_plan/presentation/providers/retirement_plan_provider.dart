import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/retirement_plan.dart';
import '../../data/retirement_plan_repository.dart';

part 'retirement_plan_provider.g.dart';

@riverpod
Future<RetirementPlan> retirementPlan(Ref ref) {
  return ref.watch(retirementPlanRepositoryProvider).getRetirementPlan();
}
