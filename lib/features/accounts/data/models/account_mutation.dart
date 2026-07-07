import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'account_mutation.freezed.dart';
part 'account_mutation.g.dart';

@freezed
abstract class AccountMutation with _$AccountMutation {
  const factory AccountMutation({
    required AccountMutationAccount account,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoAwalTurunan,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoSebelumPeriode,
    required bool konsisten,
    @Default([]) List<MutationEntry> mutasi,
  }) = _AccountMutation;

  factory AccountMutation.fromJson(Map<String, dynamic> json) =>
      _$AccountMutationFromJson(json);
}

@freezed
abstract class AccountMutationAccount with _$AccountMutationAccount {
  const factory AccountMutationAccount({
    required String id,
    required String nama,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoCache,
  }) = _AccountMutationAccount;

  factory AccountMutationAccount.fromJson(Map<String, dynamic> json) =>
      _$AccountMutationAccountFromJson(json);
}

@freezed
abstract class MutationEntry with _$MutationEntry {
  const factory MutationEntry({
    required String id,
    required String tanggal,
    required String type,
    required String kategori,
    required String rincian,
    @JsonKey(fromJson: parseJsonIntOrString) required int nominal,
    @JsonKey(fromJson: parseJsonIntOrString) required int delta,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoSetelah,
  }) = _MutationEntry;

  factory MutationEntry.fromJson(Map<String, dynamic> json) =>
      _$MutationEntryFromJson(json);
}
