import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'wealth_history_point.freezed.dart';
part 'wealth_history_point.g.dart';

@freezed
abstract class WealthHistoryPoint with _$WealthHistoryPoint {
  const factory WealthHistoryPoint({
    required String tanggal,
    @JsonKey(fromJson: parseJsonInt) required int kekayaanBersih,
  }) = _WealthHistoryPoint;

  factory WealthHistoryPoint.fromJson(Map<String, dynamic> json) =>
      _$WealthHistoryPointFromJson(json);
}

@freezed
abstract class WealthHistory with _$WealthHistory {
  const WealthHistory._();

  const factory WealthHistory({
    @Default([]) List<WealthHistoryPoint> history,
    @JsonKey(fromJson: parseJsonInt) @Default(0) int delta,
  }) = _WealthHistory;

  factory WealthHistory.fromJson(Map<String, dynamic> json) =>
      _$WealthHistoryFromJson(json);

  bool get hasEnoughPoints => history.length >= 2;
}
