import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/account.dart';
import '../providers/accounts_list_provider.dart';

const accountDeleteConflictMessage =
    'Rekening ini masih punya transaksi terkait, tidak bisa dihapus';

class AccountsListPage extends ConsumerWidget {
  const AccountsListPage({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Account account,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus rekening?'),
        content: Text(
          'Rekening "${account.nama}" akan dihapus permanen. Tindakan ini tidak bisa dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    try {
      await ref.read(accountsListProvider.notifier).deleteAccount(account.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rekening "${account.nama}" berhasil dihapus')),
        );
      }
    } on ApiException catch (error) {
      if (!context.mounted) {
        return;
      }

      if (error.statusCode == 409) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Tidak bisa dihapus'),
            content: const Text(accountDeleteConflictMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Mengerti'),
              ),
            ],
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Terjadi kesalahan. Silakan coba lagi.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Rekening'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/accounts/new'),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(accountsListProvider);
          await ref.read(accountsListProvider.future);
        },
        child: AsyncValueWidget<List<Account>>(
          value: accountsAsync,
          onRetry: () => ref.invalidate(accountsListProvider),
          data: (accounts) {
            if (accounts.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  EmptyStateWidget(
                    title: 'Belum ada rekening',
                    message:
                        'Tambahkan rekening pertama untuk mulai mencatat kas dan tabunganmu.',
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: accounts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Card(
                  child: ListTile(
                    onTap: () => context.push(
                      '/accounts/${account.id}/mutasi?nama=${Uri.encodeComponent(account.nama)}',
                    ),
                    title: Text(account.nama),
                    subtitle: Text(formatRupiah(account.saldoCache)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Edit',
                          onPressed: () => context.push(
                            '/accounts/${account.id}/edit',
                            extra: account,
                          ),
                          icon: const Icon(Icons.edit_outlined),
                        ),
                        IconButton(
                          tooltip: 'Hapus',
                          onPressed: () => _confirmDelete(context, ref, account),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
