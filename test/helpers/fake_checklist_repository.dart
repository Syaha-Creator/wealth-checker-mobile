import 'package:dio/dio.dart';

import 'package:wealth_checker_mobile/shared/data/checklist_repository.dart';
import 'package:wealth_checker_mobile/shared/models/checklist_item.dart';

class FakeChecklistRepository extends ChecklistRepository {
  FakeChecklistRepository({this.items = const []})
      : super(_UnusedDio());

  final List<ChecklistItem> items;

  @override
  Future<List<ChecklistItem>> getChecklist(String category) async {
    return items;
  }

  @override
  Future<ChecklistItem> toggleChecklistItem({
    required String itemKey,
    required String category,
    required bool checked,
  }) async {
    return ChecklistItem(
      itemKey: itemKey,
      isChecked: checked,
      updatedAt: '2026-07-08T00:00:00.000Z',
    );
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
