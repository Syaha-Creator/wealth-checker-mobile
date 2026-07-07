import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'emergency_fund.freezed.dart';
part 'emergency_fund.g.dart';

@freezed
abstract class EmergencyFund with _$EmergencyFund {
  const EmergencyFund._();

  const factory EmergencyFund({
    @JsonKey(fromJson: parseJsonMoneyAmount) required int danaDarurat,
    required String status,
    /// `null` when `pengeluaranBulananRataRata` is not set in the profile.
    @JsonKey(fromJson: parseJsonDoubleOrStringNullable)
    double? bulanTertanggung,
  }) = _EmergencyFund;

  factory EmergencyFund.fromJson(Map<String, dynamic> json) =>
      _$EmergencyFundFromJson(json);

  bool get isCukup => status == 'cukup';
}
