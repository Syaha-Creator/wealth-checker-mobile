// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  id: json['id'] as String,
  userId: json['userId'] as String,
  nama: json['nama'] as String,
  saldoCache: parseJsonIntOrString(json['saldoCache']),
  isActive: json['isActive'] as bool,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'nama': instance.nama,
  'saldoCache': instance.saldoCache,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
};
