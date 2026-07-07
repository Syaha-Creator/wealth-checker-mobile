// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeItem _$IncomeItemFromJson(Map<String, dynamic> json) => _IncomeItem(
  kategori: json['kategori'] as String,
  total: parseJsonMoneyAmount(json['total']),
  persentaseDariTotal: parseJsonDoubleOrString(json['persentaseDariTotal']),
  isTerbesar: json['isTerbesar'] as bool,
);

Map<String, dynamic> _$IncomeItemToJson(_IncomeItem instance) =>
    <String, dynamic>{
      'kategori': instance.kategori,
      'total': instance.total,
      'persentaseDariTotal': instance.persentaseDariTotal,
      'isTerbesar': instance.isTerbesar,
    };

_IncomeReport _$IncomeReportFromJson(Map<String, dynamic> json) =>
    _IncomeReport(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => IncomeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      grandTotal: parseJsonMoneyAmount(json['grandTotal']),
    );

Map<String, dynamic> _$IncomeReportToJson(_IncomeReport instance) =>
    <String, dynamic>{
      'items': instance.items,
      'grandTotal': instance.grandTotal,
    };
