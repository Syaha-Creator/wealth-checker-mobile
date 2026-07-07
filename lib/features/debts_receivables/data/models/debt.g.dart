// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Debt _$DebtFromJson(Map<String, dynamic> json) => _Debt(
  id: json['id'] as String,
  userId: json['userId'] as String,
  pemberiUtang: json['pemberiUtang'] as String,
  tipe: $enumDecode(_$DebtTypeEnumMap, json['tipe']),
  saldoAwal: parseJsonIntOrString(json['saldoAwal']),
  sisaSaldo: parseJsonIntOrString(json['sisaSaldo']),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$DebtToJson(_Debt instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'pemberiUtang': instance.pemberiUtang,
  'tipe': _$DebtTypeEnumMap[instance.tipe]!,
  'saldoAwal': instance.saldoAwal,
  'sisaSaldo': instance.sisaSaldo,
  'createdAt': instance.createdAt,
};

const _$DebtTypeEnumMap = {
  DebtType.utangBiasa: 'utang_biasa',
  DebtType.kartuKredit: 'kartu_kredit',
};
