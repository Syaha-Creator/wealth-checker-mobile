// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccountsList)
final accountsListProvider = AccountsListProvider._();

final class AccountsListProvider
    extends $AsyncNotifierProvider<AccountsList, List<Account>> {
  AccountsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountsListHash();

  @$internal
  @override
  AccountsList create() => AccountsList();
}

String _$accountsListHash() => r'54deff2239b71a1f956cfd863d775e33082e1a05';

abstract class _$AccountsList extends $AsyncNotifier<List<Account>> {
  FutureOr<List<Account>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Account>>, List<Account>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Account>>, List<Account>>,
              AsyncValue<List<Account>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
