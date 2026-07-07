// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_cash_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonthSnapshot _$MonthSnapshotFromJson(Map<String, dynamic> json) =>
    _MonthSnapshot(
      bulan: json['bulan'] as String,
      pemasukan: parseJsonInt(json['pemasukan']),
      pengeluaran: parseJsonInt(json['pengeluaran']),
      sisaUangBulanan: parseJsonInt(json['sisaUangBulanan']),
    );

Map<String, dynamic> _$MonthSnapshotToJson(_MonthSnapshot instance) =>
    <String, dynamic>{
      'bulan': instance.bulan,
      'pemasukan': instance.pemasukan,
      'pengeluaran': instance.pengeluaran,
      'sisaUangBulanan': instance.sisaUangBulanan,
    };

_RollingAverage _$RollingAverageFromJson(Map<String, dynamic> json) =>
    _RollingAverage(
      pemasukan: parseJsonInt(json['pemasukan']),
      pengeluaran: parseJsonInt(json['pengeluaran']),
      sisaUangBulanan: parseJsonInt(json['sisaUangBulanan']),
    );

Map<String, dynamic> _$RollingAverageToJson(_RollingAverage instance) =>
    <String, dynamic>{
      'pemasukan': instance.pemasukan,
      'pengeluaran': instance.pengeluaran,
      'sisaUangBulanan': instance.sisaUangBulanan,
    };

_MonthlyCashFlow _$MonthlyCashFlowFromJson(
  Map<String, dynamic> json,
) => _MonthlyCashFlow(
  bulanIni: MonthSnapshot.fromJson(json['bulanIni'] as Map<String, dynamic>),
  bulanLalu: MonthSnapshot.fromJson(json['bulanLalu'] as Map<String, dynamic>),
  rataRata3Bulan: RollingAverage.fromJson(
    json['rataRata3Bulan'] as Map<String, dynamic>,
  ),
  hidupTanpaGajiBulan: parseJsonDoubleNullable(json['hidupTanpaGajiBulan']),
  usedProfileFallback: json['usedProfileFallback'] as bool,
);

Map<String, dynamic> _$MonthlyCashFlowToJson(_MonthlyCashFlow instance) =>
    <String, dynamic>{
      'bulanIni': instance.bulanIni,
      'bulanLalu': instance.bulanLalu,
      'rataRata3Bulan': instance.rataRata3Bulan,
      'hidupTanpaGajiBulan': instance.hidupTanpaGajiBulan,
      'usedProfileFallback': instance.usedProfileFallback,
    };
