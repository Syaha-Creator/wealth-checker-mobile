import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_exception.dart';
import '../../core/theme/app_theme.dart';
import '../models/checklist_definitions.dart';
import '../providers/checklist_provider.dart';

enum PersistedChecklistStyle {
  checkbox,
  appliedToggle,
}

class PersistedChecklistSection extends ConsumerWidget {
  const PersistedChecklistSection({
    super.key,
    required this.title,
    required this.category,
    required this.definitions,
    this.style = PersistedChecklistStyle.checkbox,
    this.showProgress = false,
  });

  final String title;
  final String category;
  final List<ChecklistDefinition> definitions;
  final PersistedChecklistStyle style;
  final bool showProgress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklistAsync = ref.watch(checklistProvider(category));

    return checklistAsync.when(
      data: (storedItems) {
        final displayItems = mergeChecklistDefinitions(definitions, storedItems);
        final checkedCount = countCheckedItems(displayItems);

        return AppCard.subtle(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                    ),
                  ),
                  if (showProgress)
                    Text(
                      '$checkedCount/${definitions.length}',
                      style: AppTextStyles.labelMedium(context.semanticColors.textMuted),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              ...displayItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _ChecklistRow(
                    item: item,
                    style: style,
                    onToggle: (checked) => _handleToggle(
                      context,
                      ref,
                      item.itemKey,
                      checked,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => AppCard.subtle(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Gagal memuat checklist.',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: () => ref.invalidate(checklistProvider(category)),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleToggle(
    BuildContext context,
    WidgetRef ref,
    String itemKey,
    bool checked,
  ) async {
    try {
      await ref
          .read(checklistProvider(category).notifier)
          .toggle(itemKey, checked);
    } on ApiException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gagal menyimpan checklist. Silakan coba lagi.'),
          ),
        );
      }
    }
  }
}

class _ChecklistRow extends StatelessWidget {
  const _ChecklistRow({
    required this.item,
    required this.style,
    required this.onToggle,
  });

  final ChecklistDisplayItem item;
  final PersistedChecklistStyle style;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      PersistedChecklistStyle.checkbox => _CheckboxRow(
          item: item,
          onToggle: onToggle,
        ),
      PersistedChecklistStyle.appliedToggle => _AppliedToggleRow(
          item: item,
          onToggle: onToggle,
        ),
    };
  }
}

class _CheckboxRow extends StatelessWidget {
  const _CheckboxRow({
    required this.item,
    required this.onToggle,
  });

  final ChecklistDisplayItem item;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: item.isChecked
            ? context.semanticColors.brandSoft
            : context.semanticColors.backgroundSubtle,
        borderRadius: AppRadius.circular,
      ),
      child: CheckboxListTile(
        value: item.isChecked,
        onChanged: (value) => onToggle(value ?? false),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
        ),
        title: Text(
          item.label,
          style: AppTextStyles.bodyMedium(context.semanticColors.textPrimary),
        ),
      ),
    );
  }
}

class _AppliedToggleRow extends StatelessWidget {
  const _AppliedToggleRow({
    required this.item,
    required this.onToggle,
  });

  final ChecklistDisplayItem item;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: item.isChecked
            ? context.semanticColors.accentBlueSoft
            : context.semanticColors.backgroundSubtle,
        borderRadius: AppRadius.circular,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.label,
              style: AppTextStyles.bodyMedium(context.semanticColors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.md),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: () => onToggle(!item.isChecked),
                style: OutlinedButton.styleFrom(
                  foregroundColor: item.isChecked
                      ? context.semanticColors.brand
                      : context.semanticColors.textSecondary,
                  backgroundColor: item.isChecked
                      ? context.semanticColors.brandSoft
                      : context.semanticColors.surface,
                ),
                child: Text(
                  item.isChecked ? 'Sudah Diterapkan' : 'Belum Diterapkan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
