import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'income_report.freezed.dart';
part 'income_report.g.dart';

@freezed
abstract class IncomeItem with _$IncomeItem {
  const factory IncomeItem({
    required String kategori,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int total,
    @JsonKey(fromJson: parseJsonDoubleOrString)
    required double persentaseDariTotal,
    required bool isTerbesar,
  }) = _IncomeItem;

  factory IncomeItem.fromJson(Map<String, dynamic> json) =>
      _$IncomeItemFromJson(json);
}

@freezed
abstract class IncomeReport with _$IncomeReport {
  const factory IncomeReport({
    @Default([]) List<IncomeItem> items,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int grandTotal,
  }) = _IncomeReport;

  factory IncomeReport.fromJson(Map<String, dynamic> json) =>
      _$IncomeReportFromJson(json);
}
