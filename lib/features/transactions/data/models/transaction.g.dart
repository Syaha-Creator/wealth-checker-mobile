// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String,
  userId: json['userId'] as String,
  tanggal: json['tanggal'] as String,
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  kategori: json['kategori'] as String?,
  rincian: json['rincian'] as String?,
  accountId: json['accountId'] as String?,
  relatedEntityId: json['relatedEntityId'] as String?,
  toAccountId: json['toAccountId'] as String?,
  nominal: parseJsonIntOrString(json['nominal']),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tanggal': instance.tanggal,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'kategori': instance.kategori,
      'rincian': instance.rincian,
      'accountId': instance.accountId,
      'relatedEntityId': instance.relatedEntityId,
      'toAccountId': instance.toAccountId,
      'nominal': instance.nominal,
      'createdAt': instance.createdAt,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.pendapatan: 'pendapatan',
  TransactionType.pengeluaran: 'pengeluaran',
  TransactionType.transfer: 'transfer',
  TransactionType.pinjamanUtang: 'pinjaman_utang',
  TransactionType.bayarUtang: 'bayar_utang',
  TransactionType.pemberianPiutang: 'pemberian_piutang',
  TransactionType.penerimaanPiutang: 'penerimaan_piutang',
  TransactionType.beliBarang: 'beli_barang',
  TransactionType.jualBarang: 'jual_barang',
  TransactionType.beliInvestasi: 'beli_investasi',
  TransactionType.jualInvestasi: 'jual_investasi',
};
