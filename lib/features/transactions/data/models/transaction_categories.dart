import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'transaction_categories.freezed.dart';
part 'transaction_categories.g.dart';

@freezed
abstract class TransactionCategories with _$TransactionCategories {
  const TransactionCategories._();

  const factory TransactionCategories({
    @Default([]) List<String> pendapatan,
    @Default([]) List<String> pengeluaran,
  }) = _TransactionCategories;

  factory TransactionCategories.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoriesFromJson(json);

  List<String> forType(TransactionType type) => switch (type) {
        TransactionType.pendapatan => pendapatan,
        TransactionType.pengeluaran => pengeluaran,
        TransactionType.transfer => const [],
        _ => const [],
      };
}
