// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_checkup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthCheckup _$HealthCheckupFromJson(Map<String, dynamic> json) =>
    _HealthCheckup(
      wealthLevel: parseJsonInt(json['wealthLevel']),
      wealthLevelName: json['wealthLevelName'] as String,
      diagnosa: json['diagnosa'] as String,
      saran: json['saran'] as String,
      ciri:
          (json['ciri'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      kekayaanBersih: parseJsonInt(json['kekayaanBersih']),
      totalAset: parseJsonInt(json['totalAset']),
      totalUtang: parseJsonInt(json['totalUtang']),
    );

Map<String, dynamic> _$HealthCheckupToJson(_HealthCheckup instance) =>
    <String, dynamic>{
      'wealthLevel': instance.wealthLevel,
      'wealthLevelName': instance.wealthLevelName,
      'diagnosa': instance.diagnosa,
      'saran': instance.saran,
      'ciri': instance.ciri,
      'kekayaanBersih': instance.kekayaanBersih,
      'totalAset': instance.totalAset,
      'totalUtang': instance.totalUtang,
    };
