import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/checklist_repository.dart';
import '../models/checklist_item.dart';

part 'checklist_provider.g.dart';

@riverpod
class ChecklistNotifier extends _$ChecklistNotifier {
  @override
  Future<List<ChecklistItem>> build(String category) {
    return ref.read(checklistRepositoryProvider).getChecklist(category);
  }

  Future<void> toggle(String itemKey, bool checked) async {
    final previous = state;
    if (!previous.hasValue) {
      return;
    }

    final currentItems = previous.requireValue;
    state = AsyncData(_optimisticItems(currentItems, itemKey, checked));

    try {
      final updated = await ref.read(checklistRepositoryProvider).toggleChecklistItem(
            itemKey: itemKey,
            category: category,
            checked: checked,
          );
      state = AsyncData(_upsertItem(state.requireValue, updated));
    } catch (error, stackTrace) {
      state = previous;
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

List<ChecklistItem> _optimisticItems(
  List<ChecklistItem> items,
  String itemKey,
  bool checked,
) {
  final existing = items.where((item) => item.itemKey == itemKey).firstOrNull;
  return _upsertItem(
    items,
    ChecklistItem(
      itemKey: itemKey,
      isChecked: checked,
      updatedAt: existing?.updatedAt ?? DateTime.now().toUtc().toIso8601String(),
    ),
  );
}

List<ChecklistItem> _upsertItem(
  List<ChecklistItem> items,
  ChecklistItem updated,
) {
  final index = items.indexWhere((item) => item.itemKey == updated.itemKey);
  if (index < 0) {
    return [...items, updated];
  }

  return [
    ...items.sublist(0, index),
    updated,
    ...items.sublist(index + 1),
  ];
}
