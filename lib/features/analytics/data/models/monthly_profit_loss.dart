import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'monthly_profit_loss.freezed.dart';
part 'monthly_profit_loss.g.dart';

@freezed
abstract class MonthlyProfitLoss with _$MonthlyProfitLoss {
  const MonthlyProfitLoss._();

  const factory MonthlyProfitLoss({
    required String bulan,
    @JsonKey(fromJson: parseJsonInt) required int pendapatan,
    @JsonKey(fromJson: parseJsonInt) required int pinjamanMasuk,
    @JsonKey(fromJson: parseJsonInt) required int bayarUtang,
    @JsonKey(fromJson: parseJsonInt) required int piutangTerbayar,
    @JsonKey(fromJson: parseJsonInt) required int pengeluaran,
    @JsonKey(fromJson: parseJsonInt) required int tabungan,
    required bool tabunganNegatif,
  }) = _MonthlyProfitLoss;

  factory MonthlyProfitLoss.fromJson(Map<String, dynamic> json) =>
      _$MonthlyProfitLossFromJson(json);
}
