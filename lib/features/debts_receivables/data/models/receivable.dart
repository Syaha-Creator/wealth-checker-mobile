import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'receivable.freezed.dart';
part 'receivable.g.dart';

@freezed
abstract class Receivable with _$Receivable {
  const Receivable._();

  const factory Receivable({
    required String id,
    required String userId,
    required String peminjam,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoAwal,
    @JsonKey(fromJson: parseJsonIntOrString) required int sisaSaldo,
    required String createdAt,
  }) = _Receivable;

  factory Receivable.fromJson(Map<String, dynamic> json) =>
      _$ReceivableFromJson(json);

  bool get isActive => sisaSaldo > 0;

  double get collectionProgress {
    if (saldoAwal <= 0) {
      return 1;
    }
    final collected = saldoAwal - sisaSaldo;
    return (collected / saldoAwal).clamp(0, 1);
  }
}
