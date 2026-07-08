// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChecklistNotifier)
final checklistProvider = ChecklistNotifierFamily._();

final class ChecklistNotifierProvider
    extends $AsyncNotifierProvider<ChecklistNotifier, List<ChecklistItem>> {
  ChecklistNotifierProvider._({
    required ChecklistNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'checklistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checklistNotifierHash();

  @override
  String toString() {
    return r'checklistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChecklistNotifier create() => ChecklistNotifier();

  @override
  bool operator ==(Object other) {
    return other is ChecklistNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checklistNotifierHash() => r'61adaa2b37f2bb86d00996906f31284bc6744bd7';

final class ChecklistNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ChecklistNotifier,
          AsyncValue<List<ChecklistItem>>,
          List<ChecklistItem>,
          FutureOr<List<ChecklistItem>>,
          String
        > {
  ChecklistNotifierFamily._()
    : super(
        retry: null,
        name: r'checklistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChecklistNotifierProvider call(String category) =>
      ChecklistNotifierProvider._(argument: category, from: this);

  @override
  String toString() => r'checklistProvider';
}

abstract class _$ChecklistNotifier extends $AsyncNotifier<List<ChecklistItem>> {
  late final _$args = ref.$arg as String;
  String get category => _$args;

  FutureOr<List<ChecklistItem>> build(String category);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ChecklistItem>>, List<ChecklistItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ChecklistItem>>, List<ChecklistItem>>,
              AsyncValue<List<ChecklistItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
