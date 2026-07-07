import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/account_mutation.dart';
import '../providers/account_mutation_provider.dart';

const invalidDateFilterMessage =
    'Tanggal mulai harus sebelum tanggal akhir';

String accountMutationErrorMessage(Object error) {
  if (error is ApiException && error.statusCode == 400) {
    return invalidDateFilterMessage;
  }
  if (error is ApiException) {
    return error.message;
  }
  return 'Terjadi kesalahan. Silakan coba lagi.';
}

class AccountMutationPage extends ConsumerStatefulWidget {
  const AccountMutationPage({
    super.key,
    required this.accountId,
    this.accountName,
    this.initialFrom,
    this.initialTo,
  });

  final String accountId;
  final String? accountName;
  final DateTime? initialFrom;
  final DateTime? initialTo;

  @override
  ConsumerState<AccountMutationPage> createState() =>
      _AccountMutationPageState();
}

class _AccountMutationPageState extends ConsumerState<AccountMutationPage> {
  late DateTime? _fromDate;
  late DateTime? _toDate;

  @override
  void initState() {
    super.initState();
    _fromDate = widget.initialFrom;
    _toDate = widget.initialTo;
  }

  bool get _hasActiveFilter => _fromDate != null || _toDate != null;

  AccountMutationQuery get _query => AccountMutationQuery(
        accountId: widget.accountId,
        from: _fromDate,
        to: _toDate,
      );

  Future<void> _pickDate({
    required bool isFrom,
  }) async {
    final initialDate = isFrom
        ? (_fromDate ?? DateTime.now())
        : (_toDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked == null) {
      return;
    }

    setState(() {
      if (isFrom) {
        _fromDate = picked;
      } else {
        _toDate = picked;
      }
    });
  }

  void _clearDates() {
    setState(() {
      _fromDate = null;
      _toDate = null;
    });
  }

  String _formatDisplayDate(DateTime? date) {
    if (date == null) {
      return 'Pilih tanggal';
    }
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final mutationAsync = ref.watch(accountMutationProvider(_query));
    final title = widget.accountName ?? 'Mutasi Rekening';

    ref.listen(accountMutationProvider(_query), (previous, next) {
      if (!next.hasError || !_hasActiveFilter) {
        return;
      }

      final error = next.error;
      if (error is ApiException && error.statusCode == 400) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(invalidDateFilterMessage)),
          );
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Filter tanggal',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _pickDate(isFrom: true),
                        child: Text('Dari: ${_formatDisplayDate(_fromDate)}'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _pickDate(isFrom: false),
                        child: Text('Sampai: ${_formatDisplayDate(_toDate)}'),
                      ),
                    ),
                  ],
                ),
                if (_hasActiveFilter) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _clearDates,
                      child: const Text('Reset filter'),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(accountMutationProvider(_query));
                await ref.read(accountMutationProvider(_query).future);
              },
              child: AsyncValueWidget<AccountMutation>(
                value: mutationAsync,
                onRetry: () => ref.invalidate(accountMutationProvider(_query)),
                errorMessageBuilder: accountMutationErrorMessage,
                data: (mutation) => AccountMutationContent(
                  mutation: mutation,
                  hasActiveFilter: _hasActiveFilter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountMutationContent extends StatelessWidget {
  const AccountMutationContent({
    super.key,
    required this.mutation,
    required this.hasActiveFilter,
  });

  final AccountMutation mutation;
  final bool hasActiveFilter;

  @override
  Widget build(BuildContext context) {
    if (mutation.mutasi.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          _MutationSummaryCard(mutation: mutation),
          if (hasActiveFilter) ...[
            const SizedBox(height: 8),
            _PeriodOpeningBalanceCard(
              saldoSebelumPeriode: mutation.saldoSebelumPeriode,
            ),
          ],
          const SizedBox(height: 32),
          EmptyStateWidget(
            title: hasActiveFilter
                ? 'Tidak ada transaksi dalam periode'
                : 'Belum ada mutasi',
            message: hasActiveFilter
                ? 'Tidak ada mutasi dalam rentang tanggal yang dipilih.'
                : 'Riwayat transaksi untuk rekening ini akan muncul di sini.',
            icon: Icons.receipt_long_outlined,
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: mutation.mutasi.length + 1 + (hasActiveFilter ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        var currentIndex = index;

        if (currentIndex == 0) {
          return _MutationSummaryCard(mutation: mutation);
        }
        currentIndex--;

        if (hasActiveFilter && currentIndex == 0) {
          return _PeriodOpeningBalanceCard(
            saldoSebelumPeriode: mutation.saldoSebelumPeriode,
          );
        }
        if (hasActiveFilter) {
          currentIndex--;
        }

        final entry = mutation.mutasi[currentIndex];
        return _MutationTile(entry: entry);
      },
    );
  }
}

class _MutationSummaryCard extends StatelessWidget {
  const _MutationSummaryCard({required this.mutation});

  final AccountMutation mutation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo saat ini: ${formatRupiah(mutation.account.saldoCache)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Saldo awal turunan: ${formatRupiah(mutation.saldoAwalTurunan)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _PeriodOpeningBalanceCard extends StatelessWidget {
  const _PeriodOpeningBalanceCard({
    required this.saldoSebelumPeriode,
  });

  final int saldoSebelumPeriode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Saldo Awal Periode',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(
              formatRupiah(saldoSebelumPeriode),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MutationTile extends StatelessWidget {
  const _MutationTile({required this.entry});

  final MutationEntry entry;

  Color _deltaColor(BuildContext context) {
    if (entry.delta > 0) {
      return Theme.of(context).colorScheme.primary;
    }
    if (entry.delta < 0) {
      return Theme.of(context).colorScheme.error;
    }
    return Theme.of(context).colorScheme.onSurface;
  }

  @override
  Widget build(BuildContext context) {
    final deltaPrefix = entry.delta > 0 ? '+' : '';

    return Card(
      child: ListTile(
        title: Text(entry.rincian.isNotEmpty ? entry.rincian : entry.kategori),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${entry.tanggal} · ${entry.type}'),
            if (entry.kategori.isNotEmpty) Text(entry.kategori),
          ],
        ),
        isThreeLine: true,
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$deltaPrefix${formatRupiah(entry.delta)}',
              style: TextStyle(
                color: _deltaColor(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              formatRupiah(entry.saldoSetelah),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
