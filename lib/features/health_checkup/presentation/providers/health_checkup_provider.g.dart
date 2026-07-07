// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_checkup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthCheckup)
final healthCheckupProvider = HealthCheckupProvider._();

final class HealthCheckupProvider
    extends
        $FunctionalProvider<
          AsyncValue<HealthCheckup>,
          HealthCheckup,
          FutureOr<HealthCheckup>
        >
    with $FutureModifier<HealthCheckup>, $FutureProvider<HealthCheckup> {
  HealthCheckupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthCheckupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthCheckupHash();

  @$internal
  @override
  $FutureProviderElement<HealthCheckup> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HealthCheckup> create(Ref ref) {
    return healthCheckup(ref);
  }
}

String _$healthCheckupHash() => r'2cdabb82b38e2188d9216796a288861d74123948';
