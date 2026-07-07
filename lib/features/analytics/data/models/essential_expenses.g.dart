// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'essential_expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EssentialExpenseRincian _$EssentialExpenseRincianFromJson(
  Map<String, dynamic> json,
) => _EssentialExpenseRincian(
  rincian: json['rincian'] as String,
  total: parseJsonMoneyAmount(json['total']),
);

Map<String, dynamic> _$EssentialExpenseRincianToJson(
  _EssentialExpenseRincian instance,
) => <String, dynamic>{'rincian': instance.rincian, 'total': instance.total};

_EssentialExpenseItem _$EssentialExpenseItemFromJson(
  Map<String, dynamic> json,
) => _EssentialExpenseItem(
  kategori: json['kategori'] as String,
  rincianList:
      (json['rincianList'] as List<dynamic>?)
          ?.map(
            (e) => EssentialExpenseRincian.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  subtotal: parseJsonMoneyAmount(json['subtotal']),
);

Map<String, dynamic> _$EssentialExpenseItemToJson(
  _EssentialExpenseItem instance,
) => <String, dynamic>{
  'kategori': instance.kategori,
  'rincianList': instance.rincianList,
  'subtotal': instance.subtotal,
};

_EssentialExpenses _$EssentialExpensesFromJson(Map<String, dynamic> json) =>
    _EssentialExpenses(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => EssentialExpenseItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      grandTotal: parseJsonMoneyAmount(json['grandTotal']),
    );

Map<String, dynamic> _$EssentialExpensesToJson(_EssentialExpenses instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'items': instance.items,
      'grandTotal': instance.grandTotal,
    };
