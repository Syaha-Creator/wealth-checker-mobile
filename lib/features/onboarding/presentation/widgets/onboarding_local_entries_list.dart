import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class OnboardingLocalEntriesList extends StatelessWidget {
  const OnboardingLocalEntriesList({
    super.key,
    required this.entries,
    required this.itemBuilder,
    required this.onRemove,
    this.emptyMessage = 'Belum ada data ditambahkan. Kamu bisa lanjut tanpa menambah.',
  });

  final List<Object> entries;
  final Widget Function(BuildContext context, int index, Object entry)
      itemBuilder;
  final void Function(int index) onRemove;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return AppCard.subtle(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(
          emptyMessage,
          style: AppTextStyles.bodyMedium(context.semanticColors.textMuted),
        ),
      );
    }

    return Column(
      children: List.generate(entries.length, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == entries.length - 1 ? 0 : AppSpacing.sm,
          ),
          child: AppCard.subtle(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: AppTextStyles.bodyMedium(context.semanticColors.textPrimary),
                    child: itemBuilder(context, index, entries[index]),
                  ),
                ),
                IconButton(
                  tooltip: 'Hapus',
                  onPressed: () => onRemove(index),
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: context.semanticColors.danger,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
