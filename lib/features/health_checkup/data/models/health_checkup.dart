import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'health_checkup.freezed.dart';
part 'health_checkup.g.dart';

@freezed
abstract class HealthCheckup with _$HealthCheckup {
  const HealthCheckup._();

  const factory HealthCheckup({
    @JsonKey(fromJson: parseJsonInt) required int wealthLevel,
    required String wealthLevelName,
    required String diagnosa,
    required String saran,
  @Default([]) List<String> ciri,
    @JsonKey(fromJson: parseJsonInt) required int kekayaanBersih,
    @JsonKey(fromJson: parseJsonInt) required int totalAset,
    @JsonKey(fromJson: parseJsonInt) required int totalUtang,
  }) = _HealthCheckup;

  factory HealthCheckup.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckupFromJson(json);

  bool get hasContent => wealthLevel >= 0 && diagnosa.isNotEmpty;
}
