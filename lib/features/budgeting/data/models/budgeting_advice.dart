import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'budgeting_advice.freezed.dart';
part 'budgeting_advice.g.dart';

@freezed
abstract class BudgetAllocation with _$BudgetAllocation {
  const factory BudgetAllocation({
    required String kategori,
    @JsonKey(fromJson: parseJsonInt) required int persen,
    @JsonKey(fromJson: parseJsonInt) required int nominal,
  }) = _BudgetAllocation;

  factory BudgetAllocation.fromJson(Map<String, dynamic> json) =>
      _$BudgetAllocationFromJson(json);
}

@freezed
abstract class BudgetingAdvice with _$BudgetingAdvice {
  const BudgetingAdvice._();

  const factory BudgetingAdvice({
    @JsonKey(fromJson: parseJsonInt) required int wealthLevel,
    required bool hasPlan,
    @JsonKey(fromJson: parseJsonInt) required int rencanaPemasukanBulanan,
    @Default([]) List<BudgetAllocation> alokasi,
    @JsonKey(fromJson: parseJsonInt) required int totalPersen,
    @JsonKey(fromJson: parseJsonInt) required int sisaTidakTeralokasi,
  }) = _BudgetingAdvice;

  factory BudgetingAdvice.fromJson(Map<String, dynamic> json) =>
      _$BudgetingAdviceFromJson(json);

  bool get canShowAllocation => wealthLevel >= 0 && alokasi.isNotEmpty;
}
