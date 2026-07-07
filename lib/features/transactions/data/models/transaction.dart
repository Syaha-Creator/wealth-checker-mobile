import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@JsonEnum(alwaysCreate: true)
enum TransactionType {
  @JsonValue('pendapatan')
  pendapatan,
  @JsonValue('pengeluaran')
  pengeluaran,
  @JsonValue('transfer')
  transfer,
  @JsonValue('pinjaman_utang')
  pinjamanUtang,
  @JsonValue('bayar_utang')
  bayarUtang,
  @JsonValue('pemberian_piutang')
  pemberianPiutang,
  @JsonValue('penerimaan_piutang')
  penerimaanPiutang,
  @JsonValue('beli_barang')
  beliBarang,
  @JsonValue('jual_barang')
  jualBarang,
  @JsonValue('beli_investasi')
  beliInvestasi,
  @JsonValue('jual_investasi')
  jualInvestasi,
}

const sprintTransactionTypes = {
  TransactionType.pendapatan,
  TransactionType.pengeluaran,
  TransactionType.transfer,
};

extension TransactionTypeX on TransactionType {
  String get label => switch (this) {
        TransactionType.pendapatan => 'Pendapatan',
        TransactionType.pengeluaran => 'Pengeluaran',
        TransactionType.transfer => 'Transfer',
        TransactionType.pinjamanUtang => 'Pinjaman Utang',
        TransactionType.bayarUtang => 'Bayar Utang',
        TransactionType.pemberianPiutang => 'Pemberian Piutang',
        TransactionType.penerimaanPiutang => 'Penerimaan Piutang',
        TransactionType.beliBarang => 'Beli Barang',
        TransactionType.jualBarang => 'Jual Barang',
        TransactionType.beliInvestasi => 'Beli Investasi',
        TransactionType.jualInvestasi => 'Jual Investasi',
      };

  bool get needsRelatedDebtDropdown => this == TransactionType.bayarUtang;

  bool get needsPemberiUtangField => this == TransactionType.pinjamanUtang;

  bool get needsRelatedReceivableDropdown =>
      this == TransactionType.penerimaanPiutang;

  bool get needsPeminjamField => this == TransactionType.pemberianPiutang;

  bool get isDebtOrReceivableType =>
      needsRelatedDebtDropdown ||
      needsPemberiUtangField ||
      needsRelatedReceivableDropdown ||
      needsPeminjamField;

  bool get isAssetTransactionType =>
      this == TransactionType.beliBarang ||
      this == TransactionType.jualBarang ||
      this == TransactionType.beliInvestasi ||
      this == TransactionType.jualInvestasi;

  /// Asset buy/sell types use `namaAset`, `jumlah`, and `hargaSatuan` — not
  /// `nominal` or debt/receivable link fields.
  bool get needsAssetEntity => isAssetTransactionType;

  bool get isLiquidAssetType =>
      this == TransactionType.beliInvestasi ||
      this == TransactionType.jualInvestasi;

  bool get isFixedAssetType =>
      this == TransactionType.beliBarang ||
      this == TransactionType.jualBarang;

  bool get isAssetSellType =>
      this == TransactionType.jualBarang ||
      this == TransactionType.jualInvestasi;

  static TransactionType fromQuery(String? value) {
    if (value == null || value.isEmpty) {
      return TransactionType.pengeluaran;
    }
    return TransactionType.values.firstWhere(
      (type) => type.name == value || _jsonValue(type) == value,
      orElse: () => TransactionType.pengeluaran,
    );
  }

  static String _jsonValue(TransactionType type) {
    return switch (type) {
      TransactionType.pendapatan => 'pendapatan',
      TransactionType.pengeluaran => 'pengeluaran',
      TransactionType.transfer => 'transfer',
      TransactionType.pinjamanUtang => 'pinjaman_utang',
      TransactionType.bayarUtang => 'bayar_utang',
      TransactionType.pemberianPiutang => 'pemberian_piutang',
      TransactionType.penerimaanPiutang => 'penerimaan_piutang',
      TransactionType.beliBarang => 'beli_barang',
      TransactionType.jualBarang => 'jual_barang',
      TransactionType.beliInvestasi => 'beli_investasi',
      TransactionType.jualInvestasi => 'jual_investasi',
    };
  }
}

@freezed
abstract class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required String id,
    required String userId,
    required String tanggal,
    required TransactionType type,
    String? kategori,
    String? rincian,
    String? accountId,
    String? relatedEntityId,
  @JsonKey(name: 'toAccountId') String? toAccountId,
    @JsonKey(fromJson: parseJsonIntOrString) required int nominal,
    required String createdAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  /// Destination account for transfers — API may expose `toAccountId` or
  /// fall back to `relatedEntityId` on older responses.
  String? get destinationAccountId =>
      toAccountId ??
      (type == TransactionType.transfer ? relatedEntityId : null);
}
