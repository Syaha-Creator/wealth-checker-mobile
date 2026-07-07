import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'liquid_asset_holding.freezed.dart';
part 'liquid_asset_holding.g.dart';

@freezed
abstract class LiquidAssetHolding with _$LiquidAssetHolding {
  const LiquidAssetHolding._();

  const factory LiquidAssetHolding({
    required String id,
    required String userId,
    required String namaAset,
    @JsonKey(fromJson: parseJsonDoubleOrString) required double jumlah,
    @JsonKey(fromJson: parseJsonDoubleOrString)
    required double hargaBeliRataRata,
    required String updatedAt,
  }) = _LiquidAssetHolding;

  factory LiquidAssetHolding.fromJson(Map<String, dynamic> json) =>
      _$LiquidAssetHoldingFromJson(json);

  bool get isActive => jumlah > 0;

  double get totalNilai => jumlah * hargaBeliRataRata;
}
