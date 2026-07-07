// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(debtsRepository)
final debtsRepositoryProvider = DebtsRepositoryProvider._();

final class DebtsRepositoryProvider
    extends
        $FunctionalProvider<DebtsRepository, DebtsRepository, DebtsRepository>
    with $Provider<DebtsRepository> {
  DebtsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debtsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debtsRepositoryHash();

  @$internal
  @override
  $ProviderElement<DebtsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DebtsRepository create(Ref ref) {
    return debtsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DebtsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DebtsRepository>(value),
    );
  }
}

String _$debtsRepositoryHash() => r'8080e8b7b304936918f5b7ceed7b05e1601e81db';
