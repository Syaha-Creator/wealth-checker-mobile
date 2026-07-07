import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'debt.freezed.dart';
part 'debt.g.dart';

@JsonEnum(alwaysCreate: true)
enum DebtType {
  @JsonValue('utang_biasa')
  utangBiasa,
  @JsonValue('kartu_kredit')
  kartuKredit,
}

extension DebtTypeX on DebtType {
  String get label => switch (this) {
        DebtType.utangBiasa => 'Utang Biasa',
        DebtType.kartuKredit => 'Kartu Kredit',
      };
}

@freezed
abstract class Debt with _$Debt {
  const Debt._();

  const factory Debt({
    required String id,
    required String userId,
    required String pemberiUtang,
    required DebtType tipe,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoAwal,
    @JsonKey(fromJson: parseJsonIntOrString) required int sisaSaldo,
    required String createdAt,
  }) = _Debt;

  factory Debt.fromJson(Map<String, dynamic> json) => _$DebtFromJson(json);

  bool get isActive => sisaSaldo > 0;

  double get repaymentProgress {
    if (saldoAwal <= 0) {
      return 1;
    }
    final paid = saldoAwal - sisaSaldo;
    return (paid / saldoAwal).clamp(0, 1);
  }
}
