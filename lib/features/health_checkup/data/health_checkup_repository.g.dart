// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_checkup_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthCheckupRepository)
final healthCheckupRepositoryProvider = HealthCheckupRepositoryProvider._();

final class HealthCheckupRepositoryProvider
    extends
        $FunctionalProvider<
          HealthCheckupRepository,
          HealthCheckupRepository,
          HealthCheckupRepository
        >
    with $Provider<HealthCheckupRepository> {
  HealthCheckupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthCheckupRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthCheckupRepositoryHash();

  @$internal
  @override
  $ProviderElement<HealthCheckupRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HealthCheckupRepository create(Ref ref) {
    return healthCheckupRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HealthCheckupRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HealthCheckupRepository>(value),
    );
  }
}

String _$healthCheckupRepositoryHash() =>
    r'3e2927917f2a7c890ce422d751ec76b1c0bf3679';
