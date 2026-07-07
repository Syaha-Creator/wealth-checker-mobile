import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'retirement_plan.freezed.dart';
part 'retirement_plan.g.dart';

@freezed
abstract class RetirementPlanDetails with _$RetirementPlanDetails {
  const factory RetirementPlanDetails({
  /// Can be negative when the planned age has already passed.
    required int tahunMenujuPensiun,
    required int tahunMenujuWarisan,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int danaDibutuhkanSebelumPensiun,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int danaDibutuhkanSelamaPensiun,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int totalDanaPensiunWarisan,
  }) = _RetirementPlanDetails;

  factory RetirementPlanDetails.fromJson(Map<String, dynamic> json) =>
      _$RetirementPlanDetailsFromJson(json);
}

@freezed
abstract class RetirementCollectedFunds with _$RetirementCollectedFunds {
  const factory RetirementCollectedFunds({
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int danaDaruratTerkumpul,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int danaPensiunTerkumpul,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int danaWarisanTerkumpul,
  }) = _RetirementCollectedFunds;

  factory RetirementCollectedFunds.fromJson(Map<String, dynamic> json) =>
      _$RetirementCollectedFundsFromJson(json);
}

@freezed
abstract class RetirementDebtPayoff with _$RetirementDebtPayoff {
  const factory RetirementDebtPayoff({
    required bool bisaLunasSekarang,
    /// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
    int? bulanLunasDenganKas,
    /// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
    int? bulanLunasDenganSisaGaji,
  }) = _RetirementDebtPayoff;

  factory RetirementDebtPayoff.fromJson(Map<String, dynamic> json) =>
      _$RetirementDebtPayoffFromJson(json);
}

@freezed
abstract class RetirementRealizedPL with _$RetirementRealizedPL {
  const factory RetirementRealizedPL({
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int untungRugiJualBarang,
    @JsonKey(fromJson: parseJsonMoneyAmount)
    required int untungRugiInvestasi,
  }) = _RetirementRealizedPL;

  factory RetirementRealizedPL.fromJson(Map<String, dynamic> json) =>
      _$RetirementRealizedPLFromJson(json);
}

@freezed
abstract class RetirementPlan with _$RetirementPlan {
  const RetirementPlan._();

  const factory RetirementPlan({
    required bool hasProfile,
    String? error,
    String? mode,
    RetirementPlanDetails? plan,
    @JsonKey(fromJson: parseJsonMoneyAmountNullable) int? sisaUangBulanan,
    @JsonKey(fromJson: parseJsonMoneyAmountNullable) int? danaTerkumpulSaatIni,
    @JsonKey(fromJson: parseJsonMoneyAmountNullable) int? selisihMenujuTarget,
    RetirementCollectedFunds? collectedFunds,
    RetirementDebtPayoff? debtPayoff,
    RetirementRealizedPL? realizedPL,
  }) = _RetirementPlan;

  factory RetirementPlan.fromJson(Map<String, dynamic> json) =>
      _$RetirementPlanFromJson(json);

  bool get isComplete => hasProfile && plan != null;
}
