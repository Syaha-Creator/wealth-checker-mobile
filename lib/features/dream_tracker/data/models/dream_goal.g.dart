// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DreamGoal _$DreamGoalFromJson(Map<String, dynamic> json) => _DreamGoal(
  id: json['id'] as String,
  namaGoal: json['namaGoal'] as String,
  accountId: json['accountId'] as String?,
  targetNominal: parseJsonMoneyAmount(json['targetNominal']),
  saldoSaatIni: parseJsonMoneyAmount(json['saldoSaatIni']),
  persentase: parseJsonDoubleOrString(json['persentase']),
  tercapai: json['tercapai'] as bool,
  sisaMenujuTarget: parseJsonMoneyAmount(json['sisaMenujuTarget']),
);

Map<String, dynamic> _$DreamGoalToJson(_DreamGoal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaGoal': instance.namaGoal,
      'accountId': instance.accountId,
      'targetNominal': instance.targetNominal,
      'saldoSaatIni': instance.saldoSaatIni,
      'persentase': instance.persentase,
      'tercapai': instance.tercapai,
      'sisaMenujuTarget': instance.sisaMenujuTarget,
    };

_DreamGoalRecord _$DreamGoalRecordFromJson(Map<String, dynamic> json) =>
    _DreamGoalRecord(
      id: json['id'] as String,
      namaGoal: json['namaGoal'] as String,
      targetNominal: parseJsonMoneyAmount(json['targetNominal']),
      accountId: json['accountId'] as String?,
      saldoManual: parseJsonDoubleOrStringNullable(json['saldoManual']),
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DreamGoalRecordToJson(_DreamGoalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaGoal': instance.namaGoal,
      'targetNominal': instance.targetNominal,
      'accountId': instance.accountId,
      'saldoManual': instance.saldoManual,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
