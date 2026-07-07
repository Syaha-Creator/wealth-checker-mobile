// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionsList)
final transactionsListProvider = TransactionsListFamily._();

final class TransactionsListProvider
    extends $AsyncNotifierProvider<TransactionsList, List<Transaction>> {
  TransactionsListProvider._({
    required TransactionsListFamily super.from,
    required TransactionsFilter super.argument,
  }) : super(
         retry: null,
         name: r'transactionsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionsListHash();

  @override
  String toString() {
    return r'transactionsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TransactionsList create() => TransactionsList();

  @override
  bool operator ==(Object other) {
    return other is TransactionsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionsListHash() => r'0b4071ab9bd2f56ed95bf9dfbcc6dcd5a72297a5';

final class TransactionsListFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionsList,
          AsyncValue<List<Transaction>>,
          List<Transaction>,
          FutureOr<List<Transaction>>,
          TransactionsFilter
        > {
  TransactionsListFamily._()
    : super(
        retry: null,
        name: r'transactionsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionsListProvider call(TransactionsFilter filter) =>
      TransactionsListProvider._(argument: filter, from: this);

  @override
  String toString() => r'transactionsListProvider';
}

abstract class _$TransactionsList extends $AsyncNotifier<List<Transaction>> {
  late final _$args = ref.$arg as TransactionsFilter;
  TransactionsFilter get filter => _$args;

  FutureOr<List<Transaction>> build(TransactionsFilter filter);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Transaction>>, List<Transaction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transaction>>, List<Transaction>>,
              AsyncValue<List<Transaction>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(transactionCategories)
final transactionCategoriesProvider = TransactionCategoriesProvider._();

final class TransactionCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<TransactionCategories>,
          TransactionCategories,
          FutureOr<TransactionCategories>
        >
    with
        $FutureModifier<TransactionCategories>,
        $FutureProvider<TransactionCategories> {
  TransactionCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<TransactionCategories> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TransactionCategories> create(Ref ref) {
    return transactionCategories(ref);
  }
}

String _$transactionCategoriesHash() =>
    r'6c71b6f2590f4300d9bd545fe32c9edf44b15d2a';

@ProviderFor(transactionDetail)
final transactionDetailProvider = TransactionDetailFamily._();

final class TransactionDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Transaction>,
          Transaction,
          FutureOr<Transaction>
        >
    with $FutureModifier<Transaction>, $FutureProvider<Transaction> {
  TransactionDetailProvider._({
    required TransactionDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'transactionDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionDetailHash();

  @override
  String toString() {
    return r'transactionDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Transaction> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Transaction> create(Ref ref) {
    final argument = this.argument as String;
    return transactionDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionDetailHash() => r'9a3f22b01394ba0f8dc63166bdefde4660aba475';

final class TransactionDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Transaction>, String> {
  TransactionDetailFamily._()
    : super(
        retry: null,
        name: r'transactionDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionDetailProvider call(String id) =>
      TransactionDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'transactionDetailProvider';
}
