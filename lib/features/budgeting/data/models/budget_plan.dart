import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'budget_plan.freezed.dart';
part 'budget_plan.g.dart';

@freezed
abstract class BudgetPlan with _$BudgetPlan {
  const BudgetPlan._();

  const factory BudgetPlan({
    required String id,
    required String userId,
    required String householdId,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int rencanaPemasukanBulanan,
    required String bulanTahun,
    required String createdAt,
  }) = _BudgetPlan;

  factory BudgetPlan.fromJson(Map<String, dynamic> json) =>
      _$BudgetPlanFromJson(json);
}
