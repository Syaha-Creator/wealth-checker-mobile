// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_mutation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(accountMutation)
final accountMutationProvider = AccountMutationFamily._();

final class AccountMutationProvider
    extends
        $FunctionalProvider<
          AsyncValue<AccountMutation>,
          AccountMutation,
          FutureOr<AccountMutation>
        >
    with $FutureModifier<AccountMutation>, $FutureProvider<AccountMutation> {
  AccountMutationProvider._({
    required AccountMutationFamily super.from,
    required AccountMutationQuery super.argument,
  }) : super(
         retry: null,
         name: r'accountMutationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$accountMutationHash();

  @override
  String toString() {
    return r'accountMutationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AccountMutation> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AccountMutation> create(Ref ref) {
    final argument = this.argument as AccountMutationQuery;
    return accountMutation(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountMutationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$accountMutationHash() => r'3cadb66e023cc992a1fd607340d071f964f7581b';

final class AccountMutationFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AccountMutation>,
          AccountMutationQuery
        > {
  AccountMutationFamily._()
    : super(
        retry: null,
        name: r'accountMutationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AccountMutationProvider call(AccountMutationQuery query) =>
      AccountMutationProvider._(argument: query, from: this);

  @override
  String toString() => r'accountMutationProvider';
}
