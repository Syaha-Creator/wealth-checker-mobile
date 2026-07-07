import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'budget_vs_actual.freezed.dart';
part 'budget_vs_actual.g.dart';

@freezed
abstract class BudgetVsActualPendapatan with _$BudgetVsActualPendapatan {
  const factory BudgetVsActualPendapatan({
    @JsonKey(fromJson: parseJsonMoneyAmount) required int rencanaNominal,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int aktualNominal,
  }) = _BudgetVsActualPendapatan;

  factory BudgetVsActualPendapatan.fromJson(Map<String, dynamic> json) =>
      _$BudgetVsActualPendapatanFromJson(json);
}

@freezed
abstract class BudgetVsActualItem with _$BudgetVsActualItem {
  const factory BudgetVsActualItem({
    required String kategori,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int rencanaNominal,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int aktualNominal,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int selisih,
    /// `null` when `rencanaNominal` is 0 (division by zero on the server).
    @JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? selisihPersen,
    required bool overBudget,
  }) = _BudgetVsActualItem;

  factory BudgetVsActualItem.fromJson(Map<String, dynamic> json) =>
      _$BudgetVsActualItemFromJson(json);
}

@freezed
abstract class BudgetVsActual with _$BudgetVsActual {
  const BudgetVsActual._();

  const factory BudgetVsActual({
    @JsonKey(fromJson: parseJsonInt) required int wealthLevel,
    required bool hasPlan,
    /// `null` when the user has no financial data yet (`wealthLevel: -1`).
    BudgetVsActualPendapatan? pendapatan,
    @Default([]) List<BudgetVsActualItem> alokasi,
  }) = _BudgetVsActual;

  factory BudgetVsActual.fromJson(Map<String, dynamic> json) =>
      _$BudgetVsActualFromJson(json);

  bool get hasNoFinancialData => wealthLevel < 0;
}
