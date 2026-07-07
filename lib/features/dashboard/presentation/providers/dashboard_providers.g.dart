// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wealthSummary)
final wealthSummaryProvider = WealthSummaryProvider._();

final class WealthSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<WealthSummary>,
          WealthSummary,
          FutureOr<WealthSummary>
        >
    with $FutureModifier<WealthSummary>, $FutureProvider<WealthSummary> {
  WealthSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wealthSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wealthSummaryHash();

  @$internal
  @override
  $FutureProviderElement<WealthSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WealthSummary> create(Ref ref) {
    return wealthSummary(ref);
  }
}

String _$wealthSummaryHash() => r'47e16ecc7a6eb7b540710dd0373e26c7ae72441c';

@ProviderFor(monthlyCashFlow)
final monthlyCashFlowProvider = MonthlyCashFlowProvider._();

final class MonthlyCashFlowProvider
    extends
        $FunctionalProvider<
          AsyncValue<MonthlyCashFlow>,
          MonthlyCashFlow,
          FutureOr<MonthlyCashFlow>
        >
    with $FutureModifier<MonthlyCashFlow>, $FutureProvider<MonthlyCashFlow> {
  MonthlyCashFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyCashFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyCashFlowHash();

  @$internal
  @override
  $FutureProviderElement<MonthlyCashFlow> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MonthlyCashFlow> create(Ref ref) {
    return monthlyCashFlow(ref);
  }
}

String _$monthlyCashFlowHash() => r'7f93cb0dc99069bfd3afd918011360294c5ee3cb';
