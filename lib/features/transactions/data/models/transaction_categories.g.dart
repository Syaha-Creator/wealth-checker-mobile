// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionCategories _$TransactionCategoriesFromJson(
  Map<String, dynamic> json,
) => _TransactionCategories(
  pendapatan:
      (json['pendapatan'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  pengeluaran:
      (json['pengeluaran'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$TransactionCategoriesToJson(
  _TransactionCategories instance,
) => <String, dynamic>{
  'pendapatan': instance.pendapatan,
  'pengeluaran': instance.pengeluaran,
};
