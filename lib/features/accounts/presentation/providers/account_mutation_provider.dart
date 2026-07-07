import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/accounts_repository.dart';
import '../../data/models/account_mutation.dart';

part 'account_mutation_provider.freezed.dart';
part 'account_mutation_provider.g.dart';

@freezed
abstract class AccountMutationQuery with _$AccountMutationQuery {
  const factory AccountMutationQuery({
    required String accountId,
    DateTime? from,
    DateTime? to,
  }) = _AccountMutationQuery;
}

@riverpod
Future<AccountMutation> accountMutation(
  Ref ref,
  AccountMutationQuery query,
) {
  return ref.watch(accountsRepositoryProvider).getAccountMutation(
        accountId: query.accountId,
        from: query.from,
        to: query.to,
      );
}
