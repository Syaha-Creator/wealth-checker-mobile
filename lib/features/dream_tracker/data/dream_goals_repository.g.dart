// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_goals_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dreamGoalsRepository)
final dreamGoalsRepositoryProvider = DreamGoalsRepositoryProvider._();

final class DreamGoalsRepositoryProvider
    extends
        $FunctionalProvider<
          DreamGoalsRepository,
          DreamGoalsRepository,
          DreamGoalsRepository
        >
    with $Provider<DreamGoalsRepository> {
  DreamGoalsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dreamGoalsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dreamGoalsRepositoryHash();

  @$internal
  @override
  $ProviderElement<DreamGoalsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DreamGoalsRepository create(Ref ref) {
    return dreamGoalsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DreamGoalsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DreamGoalsRepository>(value),
    );
  }
}

String _$dreamGoalsRepositoryHash() =>
    r'502dd0427e776bec7f07265b94e85d395a713f80';
