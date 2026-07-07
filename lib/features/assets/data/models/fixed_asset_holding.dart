import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'fixed_asset_holding.freezed.dart';
part 'fixed_asset_holding.g.dart';

@freezed
abstract class FixedAssetHolding with _$FixedAssetHolding {
  const FixedAssetHolding._();

  const factory FixedAssetHolding({
    required String id,
    required String userId,
    required String namaAset,
    @JsonKey(fromJson: parseJsonDoubleOrString) required double jumlah,
    @JsonKey(fromJson: parseJsonDoubleOrString)
    required double hargaBeliRataRata,
    required String updatedAt,
  }) = _FixedAssetHolding;

  factory FixedAssetHolding.fromJson(Map<String, dynamic> json) =>
      _$FixedAssetHoldingFromJson(json);

  bool get isActive => jumlah > 0;

  double get totalNilai => jumlah * hargaBeliRataRata;
}
