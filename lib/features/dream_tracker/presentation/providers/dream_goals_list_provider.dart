import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/dream_goals_repository.dart';
import '../../data/models/dream_goal.dart';
import '../../data/models/dream_goal_input.dart';

part 'dream_goals_list_provider.g.dart';

@riverpod
class DreamGoalsList extends _$DreamGoalsList {
  @override
  Future<List<DreamGoal>> build() {
    return ref.read(dreamGoalsRepositoryProvider).getDreamGoals();
  }

  Future<void> addGoal(DreamGoalInput input) async {
    await ref.read(dreamGoalsRepositoryProvider).createDreamGoal(input);
    ref.invalidateSelf();
  }

  Future<void> updateGoal({
    required String id,
    required DreamGoalInput input,
  }) async {
    await ref.read(dreamGoalsRepositoryProvider).updateDreamGoal(
          id: id,
          input: input,
        );
    ref.invalidateSelf();
  }

  Future<void> deleteGoal(String id) async {
    await ref.read(dreamGoalsRepositoryProvider).deleteDreamGoal(id);
    ref.invalidateSelf();
  }
}
