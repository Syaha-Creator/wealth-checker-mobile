// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_fund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyFund _$EmergencyFundFromJson(Map<String, dynamic> json) =>
    _EmergencyFund(
      danaDarurat: parseJsonMoneyAmount(json['danaDarurat']),
      status: json['status'] as String,
      bulanTertanggung: parseJsonDoubleOrStringNullable(
        json['bulanTertanggung'],
      ),
    );

Map<String, dynamic> _$EmergencyFundToJson(_EmergencyFund instance) =>
    <String, dynamic>{
      'danaDarurat': instance.danaDarurat,
      'status': instance.status,
      'bulanTertanggung': instance.bulanTertanggung,
    };
