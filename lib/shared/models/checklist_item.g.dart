// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    _ChecklistItem(
      itemKey: json['itemKey'] as String,
      isChecked: json['isChecked'] as bool,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ChecklistItemToJson(_ChecklistItem instance) =>
    <String, dynamic>{
      'itemKey': instance.itemKey,
      'isChecked': instance.isChecked,
      'updatedAt': instance.updatedAt,
    };
