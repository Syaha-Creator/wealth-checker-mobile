import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/json_parsers.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String id,
    required String userId,
    required String nama,
    @JsonKey(fromJson: parseJsonIntOrString) required int saldoCache,
    required bool isActive,
    required String createdAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
