// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WealthSummary _$WealthSummaryFromJson(Map<String, dynamic> json) =>
    _WealthSummary(
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      totalKas: parseJsonInt(json['totalKas']),
      totalLiquidAssets: parseJsonInt(json['totalLiquidAssets']),
      totalFixedAssets: parseJsonInt(json['totalFixedAssets']),
      totalReceivables: parseJsonInt(json['totalReceivables']),
      totalUtang: parseJsonInt(json['totalUtang']),
      totalAset: parseJsonInt(json['totalAset']),
      kekayaanBersih: parseJsonInt(json['kekayaanBersih']),
      wealthLevel: parseJsonInt(json['wealthLevel']),
      wealthLevelName: json['wealthLevelName'] as String,
    );

Map<String, dynamic> _$WealthSummaryToJson(_WealthSummary instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'totalKas': instance.totalKas,
      'totalLiquidAssets': instance.totalLiquidAssets,
      'totalFixedAssets': instance.totalFixedAssets,
      'totalReceivables': instance.totalReceivables,
      'totalUtang': instance.totalUtang,
      'totalAset': instance.totalAset,
      'kekayaanBersih': instance.kekayaanBersih,
      'wealthLevel': instance.wealthLevel,
      'wealthLevelName': instance.wealthLevelName,
    };
