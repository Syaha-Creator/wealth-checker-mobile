// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_date_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnalyticsDateFilter)
final analyticsDateFilterProvider = AnalyticsDateFilterProvider._();

final class AnalyticsDateFilterProvider
    extends $NotifierProvider<AnalyticsDateFilter, AnalyticsDateRange> {
  AnalyticsDateFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsDateFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsDateFilterHash();

  @$internal
  @override
  AnalyticsDateFilter create() => AnalyticsDateFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsDateRange value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsDateRange>(value),
    );
  }
}

String _$analyticsDateFilterHash() =>
    r'54b22d99afce8d91d73696125bac92247a3a6dd0';

abstract class _$AnalyticsDateFilter extends $Notifier<AnalyticsDateRange> {
  AnalyticsDateRange build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AnalyticsDateRange, AnalyticsDateRange>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AnalyticsDateRange, AnalyticsDateRange>,
              AnalyticsDateRange,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
