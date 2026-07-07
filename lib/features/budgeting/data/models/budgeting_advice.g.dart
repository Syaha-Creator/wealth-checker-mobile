// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgeting_advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetAllocation _$BudgetAllocationFromJson(Map<String, dynamic> json) =>
    _BudgetAllocation(
      kategori: json['kategori'] as String,
      persen: parseJsonInt(json['persen']),
      nominal: parseJsonInt(json['nominal']),
    );

Map<String, dynamic> _$BudgetAllocationToJson(_BudgetAllocation instance) =>
    <String, dynamic>{
      'kategori': instance.kategori,
      'persen': instance.persen,
      'nominal': instance.nominal,
    };

_BudgetingAdvice _$BudgetingAdviceFromJson(Map<String, dynamic> json) =>
    _BudgetingAdvice(
      wealthLevel: parseJsonInt(json['wealthLevel']),
      hasPlan: json['hasPlan'] as bool,
      rencanaPemasukanBulanan: parseJsonInt(json['rencanaPemasukanBulanan']),
      alokasi:
          (json['alokasi'] as List<dynamic>?)
              ?.map((e) => BudgetAllocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPersen: parseJsonInt(json['totalPersen']),
      sisaTidakTeralokasi: parseJsonInt(json['sisaTidakTeralokasi']),
    );

Map<String, dynamic> _$BudgetingAdviceToJson(_BudgetingAdvice instance) =>
    <String, dynamic>{
      'wealthLevel': instance.wealthLevel,
      'hasPlan': instance.hasPlan,
      'rencanaPemasukanBulanan': instance.rencanaPemasukanBulanan,
      'alokasi': instance.alokasi,
      'totalPersen': instance.totalPersen,
      'sisaTidakTeralokasi': instance.sisaTidakTeralokasi,
    };
