import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/data/models/receivable.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/presentation/pages/receivables_list_page.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/presentation/providers/receivables_list_provider.dart';

void main() {
  group('ReceivablesListPage', () {
    testWidgets('renders active receivable with collection progress',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          receivablesListOverride: _SuccessReceivablesList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Budi'), findsOneWidget);
      expect(find.textContaining('Rp 300.000'), findsOneWidget);
      expect(find.text('Tertagih 40%'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no active receivables',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          receivablesListOverride: _EmptyReceivablesList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada piutang aktif'), findsOneWidget);
    });
  });
}

Widget _buildTestApp({
  required ReceivablesList Function() receivablesListOverride,
}) {
  return ProviderScope(
    overrides: [
      receivablesListProvider.overrideWith(receivablesListOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const ReceivablesListPage(),
    ),
  );
}

const _sampleReceivable = Receivable(
  id: 'recv-1',
  userId: 'user-1',
  peminjam: 'Budi',
  saldoAwal: 500000,
  sisaSaldo: 300000,
  createdAt: '2026-07-01T00:00:00.000Z',
);

class _SuccessReceivablesList extends ReceivablesList {
  @override
  Future<List<Receivable>> build() async => const [_sampleReceivable];
}

class _EmptyReceivablesList extends ReceivablesList {
  @override
  Future<List<Receivable>> build() async => const [];
}
