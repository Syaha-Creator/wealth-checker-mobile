// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_profit_loss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonthlyProfitLoss _$MonthlyProfitLossFromJson(Map<String, dynamic> json) =>
    _MonthlyProfitLoss(
      bulan: json['bulan'] as String,
      pendapatan: parseJsonInt(json['pendapatan']),
      pinjamanMasuk: parseJsonInt(json['pinjamanMasuk']),
      bayarUtang: parseJsonInt(json['bayarUtang']),
      piutangTerbayar: parseJsonInt(json['piutangTerbayar']),
      pengeluaran: parseJsonInt(json['pengeluaran']),
      tabungan: parseJsonInt(json['tabungan']),
      tabunganNegatif: json['tabunganNegatif'] as bool,
    );

Map<String, dynamic> _$MonthlyProfitLossToJson(_MonthlyProfitLoss instance) =>
    <String, dynamic>{
      'bulan': instance.bulan,
      'pendapatan': instance.pendapatan,
      'pinjamanMasuk': instance.pinjamanMasuk,
      'bayarUtang': instance.bayarUtang,
      'piutangTerbayar': instance.piutangTerbayar,
      'pengeluaran': instance.pengeluaran,
      'tabungan': instance.tabungan,
      'tabunganNegatif': instance.tabunganNegatif,
    };
