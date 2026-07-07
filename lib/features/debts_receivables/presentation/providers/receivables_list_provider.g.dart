// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receivables_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReceivablesList)
final receivablesListProvider = ReceivablesListProvider._();

final class ReceivablesListProvider
    extends $AsyncNotifierProvider<ReceivablesList, List<Receivable>> {
  ReceivablesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receivablesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receivablesListHash();

  @$internal
  @override
  ReceivablesList create() => ReceivablesList();
}

String _$receivablesListHash() => r'68da678b8ac8bab331b971e584cc37549a40ec9b';

abstract class _$ReceivablesList extends $AsyncNotifier<List<Receivable>> {
  FutureOr<List<Receivable>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Receivable>>, List<Receivable>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Receivable>>, List<Receivable>>,
              AsyncValue<List<Receivable>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
