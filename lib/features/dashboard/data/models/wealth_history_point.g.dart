// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth_history_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WealthHistoryPoint _$WealthHistoryPointFromJson(Map<String, dynamic> json) =>
    _WealthHistoryPoint(
      tanggal: json['tanggal'] as String,
      kekayaanBersih: parseJsonInt(json['kekayaanBersih']),
    );

Map<String, dynamic> _$WealthHistoryPointToJson(_WealthHistoryPoint instance) =>
    <String, dynamic>{
      'tanggal': instance.tanggal,
      'kekayaanBersih': instance.kekayaanBersih,
    };

_WealthHistory _$WealthHistoryFromJson(Map<String, dynamic> json) =>
    _WealthHistory(
      history:
          (json['history'] as List<dynamic>?)
              ?.map(
                (e) => WealthHistoryPoint.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      delta: json['delta'] == null ? 0 : parseJsonInt(json['delta']),
    );

Map<String, dynamic> _$WealthHistoryToJson(_WealthHistory instance) =>
    <String, dynamic>{'history': instance.history, 'delta': instance.delta};
