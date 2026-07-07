import 'package:flutter/material.dart';

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
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          emptyMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: itemBuilder(context, index, entries[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => onRemove(index),
            ),
          ),
        );
      },
    );
  }
}
