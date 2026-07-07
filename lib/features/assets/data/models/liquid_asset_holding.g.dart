// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_asset_holding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiquidAssetHolding _$LiquidAssetHoldingFromJson(Map<String, dynamic> json) =>
    _LiquidAssetHolding(
      id: json['id'] as String,
      userId: json['userId'] as String,
      namaAset: json['namaAset'] as String,
      jumlah: parseJsonDoubleOrString(json['jumlah']),
      hargaBeliRataRata: parseJsonDoubleOrString(json['hargaBeliRataRata']),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$LiquidAssetHoldingToJson(_LiquidAssetHolding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'namaAset': instance.namaAset,
      'jumlah': instance.jumlah,
      'hargaBeliRataRata': instance.hargaBeliRataRata,
      'updatedAt': instance.updatedAt,
    };
