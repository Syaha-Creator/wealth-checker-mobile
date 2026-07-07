// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receivable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Receivable _$ReceivableFromJson(Map<String, dynamic> json) => _Receivable(
  id: json['id'] as String,
  userId: json['userId'] as String,
  peminjam: json['peminjam'] as String,
  saldoAwal: parseJsonIntOrString(json['saldoAwal']),
  sisaSaldo: parseJsonIntOrString(json['sisaSaldo']),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ReceivableToJson(_Receivable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'peminjam': instance.peminjam,
      'saldoAwal': instance.saldoAwal,
      'sisaSaldo': instance.sisaSaldo,
      'createdAt': instance.createdAt,
    };
