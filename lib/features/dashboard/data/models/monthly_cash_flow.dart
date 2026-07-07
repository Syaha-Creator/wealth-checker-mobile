import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'monthly_cash_flow.freezed.dart';
part 'monthly_cash_flow.g.dart';

@freezed
abstract class MonthSnapshot with _$MonthSnapshot {
  const factory MonthSnapshot({
    required String bulan,
    @JsonKey(fromJson: parseJsonInt) required int pemasukan,
    @JsonKey(fromJson: parseJsonInt) required int pengeluaran,
    @JsonKey(fromJson: parseJsonInt) required int sisaUangBulanan,
  }) = _MonthSnapshot;

  factory MonthSnapshot.fromJson(Map<String, dynamic> json) =>
      _$MonthSnapshotFromJson(json);
}

@freezed
abstract class RollingAverage with _$RollingAverage {
  const factory RollingAverage({
    @JsonKey(fromJson: parseJsonInt) required int pemasukan,
    @JsonKey(fromJson: parseJsonInt) required int pengeluaran,
    @JsonKey(fromJson: parseJsonInt) required int sisaUangBulanan,
  }) = _RollingAverage;

  factory RollingAverage.fromJson(Map<String, dynamic> json) =>
      _$RollingAverageFromJson(json);
}

@freezed
abstract class MonthlyCashFlow with _$MonthlyCashFlow {
  const factory MonthlyCashFlow({
    required MonthSnapshot bulanIni,
    required MonthSnapshot bulanLalu,
    required RollingAverage rataRata3Bulan,
    @JsonKey(fromJson: parseJsonDoubleNullable) double? hidupTanpaGajiBulan,
    required bool usedProfileFallback,
  }) = _MonthlyCashFlow;

  factory MonthlyCashFlow.fromJson(Map<String, dynamic> json) =>
      _$MonthlyCashFlowFromJson(json);
}
