import 'checklist_item.dart';

abstract final class ChecklistCategories {
  static const legacyPlanning = 'legacy_planning';
  static const budgetingTips = 'budgeting_tips';
}

class ChecklistDefinition {
  const ChecklistDefinition({
    required this.itemKey,
    required this.label,
  });

  final String itemKey;
  final String label;
}

abstract final class LegacyPlanningChecklist {
  static const category = ChecklistCategories.legacyPlanning;

  static const items = <ChecklistDefinition>[
    ChecklistDefinition(
      itemKey: 'buat_surat_wasiat',
      label: 'Buat surat wasiat',
    ),
    ChecklistDefinition(
      itemKey: 'tentukan_ahli_waris',
      label: 'Tentukan ahli waris',
    ),
    ChecklistDefinition(
      itemKey: 'siapkan_asuransi_jiwa',
      label: 'Siapkan asuransi jiwa',
    ),
    ChecklistDefinition(
      itemKey: 'catat_aset_dokumen',
      label: 'Catat daftar aset & dokumen penting',
    ),
  ];
}

abstract final class BudgetingTipsChecklist {
  static const category = ChecklistCategories.budgetingTips;

  static const items = <ChecklistDefinition>[
    ChecklistDefinition(
      itemKey: 'otomatiskan_transfer_tabungan',
      label:
          'Otomatiskan transfer 20% pemasukan ke tabungan di awal bulan.',
    ),
    ChecklistDefinition(
      itemKey: 'pisahkan_kategori_kebutuhan_keinginan',
      label: 'Gunakan kategori terpisah untuk kebutuhan vs keinginan.',
    ),
    ChecklistDefinition(
      itemKey: 'tinjau_langganan_berkala',
      label: 'Tinjau ulang langganan yang jarang dipakai setiap 3 bulan.',
    ),
  ];
}

class ChecklistDisplayItem {
  const ChecklistDisplayItem({
    required this.itemKey,
    required this.label,
    required this.isChecked,
  });

  final String itemKey;
  final String label;
  final bool isChecked;
}

List<ChecklistDisplayItem> mergeChecklistDefinitions(
  List<ChecklistDefinition> definitions,
  List<ChecklistItem> storedItems,
) {
  final statusByKey = {
    for (final item in storedItems) item.itemKey: item.isChecked,
  };

  return definitions
      .map(
        (definition) => ChecklistDisplayItem(
          itemKey: definition.itemKey,
          label: definition.label,
          isChecked: statusByKey[definition.itemKey] ?? false,
        ),
      )
      .toList();
}

int countCheckedItems(List<ChecklistDisplayItem> items) =>
    items.where((item) => item.isChecked).length;
