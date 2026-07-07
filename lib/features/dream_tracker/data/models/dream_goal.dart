import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'dream_goal.freezed.dart';
part 'dream_goal.g.dart';

/// Computed list item from `GET /api/dream-goals`.
@freezed
abstract class DreamGoal with _$DreamGoal {
  const DreamGoal._();

  const factory DreamGoal({
    required String id,
    required String namaGoal,
    String? accountId,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int targetNominal,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int saldoSaatIni,
    @JsonKey(fromJson: parseJsonDoubleOrString) required double persentase,
    required bool tercapai,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int sisaMenujuTarget,
  }) = _DreamGoal;

  factory DreamGoal.fromJson(Map<String, dynamic> json) =>
      _$DreamGoalFromJson(json);

  bool get isLinkedToAccount => accountId != null && accountId!.isNotEmpty;
}

/// Raw DB row returned by `POST` / `PATCH /api/dream-goals/:id`.
/// Does NOT include computed fields (`persentase`, `tercapai`, etc.).
@freezed
abstract class DreamGoalRecord with _$DreamGoalRecord {
  const factory DreamGoalRecord({
    required String id,
    required String namaGoal,
    @JsonKey(fromJson: parseJsonMoneyAmount) required int targetNominal,
    String? accountId,
    @JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? saldoManual,
    String? userId,
    String? createdAt,
    String? updatedAt,
  }) = _DreamGoalRecord;

  factory DreamGoalRecord.fromJson(Map<String, dynamic> json) =>
      _$DreamGoalRecordFromJson(json);
}
