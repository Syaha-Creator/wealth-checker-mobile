import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'wealth_summary.freezed.dart';
part 'wealth_summary.g.dart';

@freezed
abstract class WealthSummary with _$WealthSummary {
  const factory WealthSummary({
    required String userName,
    required String userEmail,
    @JsonKey(fromJson: parseJsonInt) required int totalKas,
    @JsonKey(fromJson: parseJsonInt) required int totalLiquidAssets,
    @JsonKey(fromJson: parseJsonInt) required int totalFixedAssets,
    @JsonKey(fromJson: parseJsonInt) required int totalReceivables,
    @JsonKey(fromJson: parseJsonInt) required int totalUtang,
    @JsonKey(fromJson: parseJsonInt) required int totalAset,
    @JsonKey(fromJson: parseJsonInt) required int kekayaanBersih,
    @JsonKey(fromJson: parseJsonInt) required int wealthLevel,
    required String wealthLevelName,
  }) = _WealthSummary;

  factory WealthSummary.fromJson(Map<String, dynamic> json) =>
      _$WealthSummaryFromJson(json);
}

extension WealthSummaryBreakdown on WealthSummary {
  int get totalUang => totalKas + totalLiquidAssets + totalReceivables;

  int get totalBarang => totalFixedAssets;

  bool get needsOnboarding => wealthLevel == -1;
}
