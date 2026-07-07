// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetPlan _$BudgetPlanFromJson(Map<String, dynamic> json) => _BudgetPlan(
  id: json['id'] as String,
  userId: json['userId'] as String,
  householdId: json['householdId'] as String,
  rencanaPemasukanBulanan: parseJsonMoneyAmount(
    json['rencanaPemasukanBulanan'],
  ),
  bulanTahun: json['bulanTahun'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$BudgetPlanToJson(_BudgetPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'householdId': instance.householdId,
      'rencanaPemasukanBulanan': instance.rencanaPemasukanBulanan,
      'bulanTahun': instance.bulanTahun,
      'createdAt': instance.createdAt,
    };
