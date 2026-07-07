// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_vs_actual.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetVsActualPendapatan _$BudgetVsActualPendapatanFromJson(
  Map<String, dynamic> json,
) => _BudgetVsActualPendapatan(
  rencanaNominal: parseJsonMoneyAmount(json['rencanaNominal']),
  aktualNominal: parseJsonMoneyAmount(json['aktualNominal']),
);

Map<String, dynamic> _$BudgetVsActualPendapatanToJson(
  _BudgetVsActualPendapatan instance,
) => <String, dynamic>{
  'rencanaNominal': instance.rencanaNominal,
  'aktualNominal': instance.aktualNominal,
};

_BudgetVsActualItem _$BudgetVsActualItemFromJson(Map<String, dynamic> json) =>
    _BudgetVsActualItem(
      kategori: json['kategori'] as String,
      rencanaNominal: parseJsonMoneyAmount(json['rencanaNominal']),
      aktualNominal: parseJsonMoneyAmount(json['aktualNominal']),
      selisih: parseJsonMoneyAmount(json['selisih']),
      selisihPersen: parseJsonDoubleOrStringNullable(json['selisihPersen']),
      overBudget: json['overBudget'] as bool,
    );

Map<String, dynamic> _$BudgetVsActualItemToJson(_BudgetVsActualItem instance) =>
    <String, dynamic>{
      'kategori': instance.kategori,
      'rencanaNominal': instance.rencanaNominal,
      'aktualNominal': instance.aktualNominal,
      'selisih': instance.selisih,
      'selisihPersen': instance.selisihPersen,
      'overBudget': instance.overBudget,
    };

_BudgetVsActual _$BudgetVsActualFromJson(Map<String, dynamic> json) =>
    _BudgetVsActual(
      wealthLevel: parseJsonInt(json['wealthLevel']),
      hasPlan: json['hasPlan'] as bool,
      pendapatan: json['pendapatan'] == null
          ? null
          : BudgetVsActualPendapatan.fromJson(
              json['pendapatan'] as Map<String, dynamic>,
            ),
      alokasi:
          (json['alokasi'] as List<dynamic>?)
              ?.map(
                (e) => BudgetVsActualItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BudgetVsActualToJson(_BudgetVsActual instance) =>
    <String, dynamic>{
      'wealthLevel': instance.wealthLevel,
      'hasPlan': instance.hasPlan,
      'pendapatan': instance.pendapatan,
      'alokasi': instance.alokasi,
    };
