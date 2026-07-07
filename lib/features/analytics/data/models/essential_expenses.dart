import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'essential_expenses.freezed.dart';
part 'essential_expenses.g.dart';

@freezed
abstract class EssentialExpenseRincian with _$EssentialExpenseRincian {
  const factory EssentialExpenseRincian({
    required String rincian,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int total,
  }) = _EssentialExpenseRincian;

  factory EssentialExpenseRincian.fromJson(Map<String, dynamic> json) =>
      _$EssentialExpenseRincianFromJson(json);
}

@freezed
abstract class EssentialExpenseItem with _$EssentialExpenseItem {
  const factory EssentialExpenseItem({
    required String kategori,
    @Default([]) List<EssentialExpenseRincian> rincianList,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int subtotal,
  }) = _EssentialExpenseItem;

  factory EssentialExpenseItem.fromJson(Map<String, dynamic> json) =>
      _$EssentialExpenseItemFromJson(json);
}

@freezed
abstract class EssentialExpenses with _$EssentialExpenses {
  const factory EssentialExpenses({
    @Default([]) List<String> categories,
    @Default([]) List<EssentialExpenseItem> items,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int grandTotal,
  }) = _EssentialExpenses;

  factory EssentialExpenses.fromJson(Map<String, dynamic> json) =>
      _$EssentialExpensesFromJson(json);
}
