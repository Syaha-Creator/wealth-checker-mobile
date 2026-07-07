// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_goals_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DreamGoalsList)
final dreamGoalsListProvider = DreamGoalsListProvider._();

final class DreamGoalsListProvider
    extends $AsyncNotifierProvider<DreamGoalsList, List<DreamGoal>> {
  DreamGoalsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dreamGoalsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dreamGoalsListHash();

  @$internal
  @override
  DreamGoalsList create() => DreamGoalsList();
}

String _$dreamGoalsListHash() => r'eff041aa77058c21dd93edd1a57328a46895532d';

abstract class _$DreamGoalsList extends $AsyncNotifier<List<DreamGoal>> {
  FutureOr<List<DreamGoal>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<DreamGoal>>, List<DreamGoal>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<DreamGoal>>, List<DreamGoal>>,
              AsyncValue<List<DreamGoal>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
