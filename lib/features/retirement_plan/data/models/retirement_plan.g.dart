// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retirement_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RetirementPlanDetails _$RetirementPlanDetailsFromJson(
  Map<String, dynamic> json,
) => _RetirementPlanDetails(
  tahunMenujuPensiun: (json['tahunMenujuPensiun'] as num).toInt(),
  tahunMenujuWarisan: (json['tahunMenujuWarisan'] as num).toInt(),
  danaDibutuhkanSebelumPensiun: parseJsonMoneyAmount(
    json['danaDibutuhkanSebelumPensiun'],
  ),
  danaDibutuhkanSelamaPensiun: parseJsonMoneyAmount(
    json['danaDibutuhkanSelamaPensiun'],
  ),
  totalDanaPensiunWarisan: parseJsonMoneyAmount(
    json['totalDanaPensiunWarisan'],
  ),
);

Map<String, dynamic> _$RetirementPlanDetailsToJson(
  _RetirementPlanDetails instance,
) => <String, dynamic>{
  'tahunMenujuPensiun': instance.tahunMenujuPensiun,
  'tahunMenujuWarisan': instance.tahunMenujuWarisan,
  'danaDibutuhkanSebelumPensiun': instance.danaDibutuhkanSebelumPensiun,
  'danaDibutuhkanSelamaPensiun': instance.danaDibutuhkanSelamaPensiun,
  'totalDanaPensiunWarisan': instance.totalDanaPensiunWarisan,
};

_RetirementCollectedFunds _$RetirementCollectedFundsFromJson(
  Map<String, dynamic> json,
) => _RetirementCollectedFunds(
  danaDaruratTerkumpul: parseJsonMoneyAmount(json['danaDaruratTerkumpul']),
  danaPensiunTerkumpul: parseJsonMoneyAmount(json['danaPensiunTerkumpul']),
  danaWarisanTerkumpul: parseJsonMoneyAmount(json['danaWarisanTerkumpul']),
);

Map<String, dynamic> _$RetirementCollectedFundsToJson(
  _RetirementCollectedFunds instance,
) => <String, dynamic>{
  'danaDaruratTerkumpul': instance.danaDaruratTerkumpul,
  'danaPensiunTerkumpul': instance.danaPensiunTerkumpul,
  'danaWarisanTerkumpul': instance.danaWarisanTerkumpul,
};

_RetirementDebtPayoff _$RetirementDebtPayoffFromJson(
  Map<String, dynamic> json,
) => _RetirementDebtPayoff(
  bisaLunasSekarang: json['bisaLunasSekarang'] as bool,
  bulanLunasDenganKas: (json['bulanLunasDenganKas'] as num?)?.toInt(),
  bulanLunasDenganSisaGaji: (json['bulanLunasDenganSisaGaji'] as num?)?.toInt(),
);

Map<String, dynamic> _$RetirementDebtPayoffToJson(
  _RetirementDebtPayoff instance,
) => <String, dynamic>{
  'bisaLunasSekarang': instance.bisaLunasSekarang,
  'bulanLunasDenganKas': instance.bulanLunasDenganKas,
  'bulanLunasDenganSisaGaji': instance.bulanLunasDenganSisaGaji,
};

_RetirementRealizedPL _$RetirementRealizedPLFromJson(
  Map<String, dynamic> json,
) => _RetirementRealizedPL(
  untungRugiJualBarang: parseJsonMoneyAmount(json['untungRugiJualBarang']),
  untungRugiInvestasi: parseJsonMoneyAmount(json['untungRugiInvestasi']),
);

Map<String, dynamic> _$RetirementRealizedPLToJson(
  _RetirementRealizedPL instance,
) => <String, dynamic>{
  'untungRugiJualBarang': instance.untungRugiJualBarang,
  'untungRugiInvestasi': instance.untungRugiInvestasi,
};

_RetirementPlan _$RetirementPlanFromJson(Map<String, dynamic> json) =>
    _RetirementPlan(
      hasProfile: json['hasProfile'] as bool,
      error: json['error'] as String?,
      mode: json['mode'] as String?,
      plan: json['plan'] == null
          ? null
          : RetirementPlanDetails.fromJson(
              json['plan'] as Map<String, dynamic>,
            ),
      sisaUangBulanan: parseJsonMoneyAmountNullable(json['sisaUangBulanan']),
      danaTerkumpulSaatIni: parseJsonMoneyAmountNullable(
        json['danaTerkumpulSaatIni'],
      ),
      selisihMenujuTarget: parseJsonMoneyAmountNullable(
        json['selisihMenujuTarget'],
      ),
      collectedFunds: json['collectedFunds'] == null
          ? null
          : RetirementCollectedFunds.fromJson(
              json['collectedFunds'] as Map<String, dynamic>,
            ),
      debtPayoff: json['debtPayoff'] == null
          ? null
          : RetirementDebtPayoff.fromJson(
              json['debtPayoff'] as Map<String, dynamic>,
            ),
      realizedPL: json['realizedPL'] == null
          ? null
          : RetirementRealizedPL.fromJson(
              json['realizedPL'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RetirementPlanToJson(_RetirementPlan instance) =>
    <String, dynamic>{
      'hasProfile': instance.hasProfile,
      'error': instance.error,
      'mode': instance.mode,
      'plan': instance.plan,
      'sisaUangBulanan': instance.sisaUangBulanan,
      'danaTerkumpulSaatIni': instance.danaTerkumpulSaatIni,
      'selisihMenujuTarget': instance.selisihMenujuTarget,
      'collectedFunds': instance.collectedFunds,
      'debtPayoff': instance.debtPayoff,
      'realizedPL': instance.realizedPL,
    };
