// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(assetsRepository)
final assetsRepositoryProvider = AssetsRepositoryProvider._();

final class AssetsRepositoryProvider
    extends
        $FunctionalProvider<
          AssetsRepository,
          AssetsRepository,
          AssetsRepository
        >
    with $Provider<AssetsRepository> {
  AssetsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetsRepositoryHash();

  @$internal
  @override
  $ProviderElement<AssetsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AssetsRepository create(Ref ref) {
    return assetsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetsRepository>(value),
    );
  }
}

String _$assetsRepositoryHash() => r'668307b07620d2daad149d4206e5ae4e711b9500';
