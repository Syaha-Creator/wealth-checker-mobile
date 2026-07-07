// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_mutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountMutation _$AccountMutationFromJson(Map<String, dynamic> json) =>
    _AccountMutation(
      account: AccountMutationAccount.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
      saldoAwalTurunan: parseJsonIntOrString(json['saldoAwalTurunan']),
      saldoSebelumPeriode: parseJsonIntOrString(json['saldoSebelumPeriode']),
      konsisten: json['konsisten'] as bool,
      mutasi:
          (json['mutasi'] as List<dynamic>?)
              ?.map((e) => MutationEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccountMutationToJson(_AccountMutation instance) =>
    <String, dynamic>{
      'account': instance.account,
      'saldoAwalTurunan': instance.saldoAwalTurunan,
      'saldoSebelumPeriode': instance.saldoSebelumPeriode,
      'konsisten': instance.konsisten,
      'mutasi': instance.mutasi,
    };

_AccountMutationAccount _$AccountMutationAccountFromJson(
  Map<String, dynamic> json,
) => _AccountMutationAccount(
  id: json['id'] as String,
  nama: json['nama'] as String,
  saldoCache: parseJsonIntOrString(json['saldoCache']),
);

Map<String, dynamic> _$AccountMutationAccountToJson(
  _AccountMutationAccount instance,
) => <String, dynamic>{
  'id': instance.id,
  'nama': instance.nama,
  'saldoCache': instance.saldoCache,
};

_MutationEntry _$MutationEntryFromJson(Map<String, dynamic> json) =>
    _MutationEntry(
      id: json['id'] as String,
      tanggal: json['tanggal'] as String,
      type: json['type'] as String,
      kategori: json['kategori'] as String,
      rincian: json['rincian'] as String,
      nominal: parseJsonIntOrString(json['nominal']),
      delta: parseJsonIntOrString(json['delta']),
      saldoSetelah: parseJsonIntOrString(json['saldoSetelah']),
    );

Map<String, dynamic> _$MutationEntryToJson(_MutationEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tanggal': instance.tanggal,
      'type': instance.type,
      'kategori': instance.kategori,
      'rincian': instance.rincian,
      'nominal': instance.nominal,
      'delta': instance.delta,
      'saldoSetelah': instance.saldoSetelah,
    };
