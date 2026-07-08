import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/fixed_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/liquid_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/fixed_asset_holdings_provider.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/liquid_asset_holdings_provider.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/data/models/debt.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/presentation/providers/debts_list_provider.dart';
import 'package:wealth_checker_mobile/features/more/presentation/pages/more_page.dart';

void main() {
  group('MorePage', () {
    testWidgets('renders menu items and opens debts quick sheet', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Kelola & Modul'), findsOneWidget);
      expect(find.text('Kelola Utang'), findsOneWidget);
      expect(find.text('Kelola Aset & Investasi'), findsOneWidget);

      await tester.tap(find.byKey(const Key('more_menu_debts')));
      await tester.pumpAndSettle();

      expect(find.text('Bayar Sebagian'), findsOneWidget);
      expect(find.text('Bank ABC'), findsOneWidget);
      expect(find.byKey(const Key('more_add_debt_btn')), findsOneWidget);
    });

    testWidgets('debts add button opens snapshot mode picker', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('more_menu_debts')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('more_add_debt_btn')));
      await tester.pumpAndSettle();

      expect(find.text('Utang Baru'), findsOneWidget);
      expect(find.text('Utang yang Sudah Ada'), findsOneWidget);
    });

    testWidgets('assets add button opens snapshot mode picker', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('more_menu_assets')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('more_add_investasi_btn')));
      await tester.pumpAndSettle();

      expect(find.text('Beli Baru'), findsOneWidget);
      expect(find.text('Sudah Dimiliki'), findsOneWidget);
    });

    testWidgets('profile sheet shows disabled soon toggles', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.byKey(const Key('more_menu_profile')),
        100,
      );
      await tester.tap(find.byKey(const Key('more_menu_profile')));
      await tester.pumpAndSettle();

      expect(find.text('Profil & Pengaturan'), findsWidgets);
      expect(find.text('Segera Hadir'), findsWidgets);
      expect(find.text('Mode Gelap'), findsOneWidget);
      expect(find.text('Fitur akan segera hadir'), findsOneWidget);
    });
  });
}

Widget _buildTestApp() {
  return ProviderScope(
    overrides: [
      accountsListProvider.overrideWith(_AccountsOverride.new),
      debtsListProvider.overrideWith(_DebtsOverride.new),
      liquidAssetHoldingsProvider.overrideWith(_EmptyLiquidHoldings.new),
      fixedAssetHoldingsProvider.overrideWith(_EmptyFixedHoldings.new),
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const MorePage(),
    ),
  );
}

const _sampleSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'jane@example.com',
  totalKas: 0,
  totalLiquidAssets: 0,
  totalFixedAssets: 0,
  totalReceivables: 0,
  totalUtang: 0,
  totalAset: 0,
  kekayaanBersih: 0,
  wealthLevel: 2,
  wealthLevelName: 'Terlihat Kaya',
);

class _AccountsOverride extends AccountsList {
  @override
  Future<List<Account>> build() async => const [
        Account(
          id: 'acc-1',
          userId: 'user-1',
          nama: 'BCA Tabungan',
          saldoCache: 1500000,
          isActive: true,
          createdAt: '2026-07-01T00:00:00.000Z',
        ),
      ];
}

class _DebtsOverride extends DebtsList {
  @override
  Future<List<Debt>> build() async => const [
        Debt(
          id: 'debt-1',
          userId: 'user-1',
          pemberiUtang: 'Bank ABC',
          tipe: DebtType.utangBiasa,
          saldoAwal: 1000000,
          sisaSaldo: 500000,
          createdAt: '2026-07-01T00:00:00.000Z',
        ),
      ];
}

class _EmptyLiquidHoldings extends LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async => const [];
}

class _EmptyFixedHoldings extends FixedAssetHoldings {
  @override
  Future<List<FixedAssetHolding>> build() async => const [];
}
