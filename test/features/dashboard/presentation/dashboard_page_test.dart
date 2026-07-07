import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/providers/analytics_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_history_point.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('DashboardPage', () {
    testWidgets('renders beranda hero, stats, level, and accounts', (tester) async {
      tester.view.physicalSize = const Size(600, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('Jane Doe'), findsOneWidget);
      expect(find.textContaining('Kekayaan Bersih'), findsOneWidget);
      expect(find.textContaining('Rp 42.500.000'), findsOneWidget);
      expect(find.text('Total Aset'), findsOneWidget);
      expect(find.text('Total Utang'), findsOneWidget);
      expect(find.textContaining('Level 2 · Terlihat Kaya'), findsOneWidget);
      expect(find.text('Rincian Akun'), findsOneWidget);
      expect(find.text('BCA Tabungan'), findsOneWidget);
    });

    testWidgets('shows positive delta with blue triangle', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('▲'), findsOneWidget);
      expect(find.textContaining('bulan ini'), findsOneWidget);
    });

    testWidgets('renders loading state', (tester) async {
      final summaryCompleter = Completer<WealthSummary>();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            wealthSummaryProvider.overrideWith((_) => summaryCompleter.future),
            wealthHistoryProvider.overrideWith((_) async => _sampleHistory),
            accountsListProvider.overrideWith(_AccountsOverride.new),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('id')],
            home: const DashboardPage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error state with retry button', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            wealthSummaryProvider.overrideWith((_) async {
              throw const ApiException(message: 'Gagal memuat ringkasan kekayaan');
            }),
            wealthHistoryProvider.overrideWith((_) async => _sampleHistory),
            accountsListProvider.overrideWith(_AccountsOverride.new),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('id')],
            home: const DashboardPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Gagal memuat ringkasan kekayaan'), findsOneWidget);
      expect(find.text('Coba lagi'), findsOneWidget);
    });

    testWidgets('renders onboarding empty state when wealthLevel is -1',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            wealthSummaryProvider.overrideWith((_) async => _onboardingSummary),
            wealthHistoryProvider.overrideWith((_) async => _sampleHistory),
            accountsListProvider.overrideWith(_AccountsOverride.new),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('id')],
            home: const DashboardPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text('Kamu belum menyelesaikan onboarding'),
        findsOneWidget,
      );
      expect(find.text('Mulai onboarding'), findsOneWidget);
      expect(find.textContaining('Kekayaan Bersih'), findsNothing);
    });
  });
}

Widget _buildTestApp() {
  return ProviderScope(
    overrides: [
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
      wealthHistoryProvider.overrideWith((_) async => _sampleHistory),
      accountsListProvider.overrideWith(_AccountsOverride.new),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const DashboardPage(),
    ),
  );
}

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

const _sampleSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'user@example.com',
  totalKas: 5000000,
  totalLiquidAssets: 15000000,
  totalFixedAssets: 30000000,
  totalReceivables: 500000,
  totalUtang: 8000000,
  totalAset: 50500000,
  kekayaanBersih: 42500000,
  wealthLevel: 2,
  wealthLevelName: 'Terlihat Kaya',
);

const _onboardingSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'user@example.com',
  totalKas: 0,
  totalLiquidAssets: 0,
  totalFixedAssets: 0,
  totalReceivables: 0,
  totalUtang: 0,
  totalAset: 0,
  kekayaanBersih: 0,
  wealthLevel: -1,
  wealthLevelName: '',
);

const _sampleHistory = WealthHistory(
  delta: 2500000,
  history: [
    WealthHistoryPoint(tanggal: '2026-05-01', kekayaanBersih: 40000000),
    WealthHistoryPoint(tanggal: '2026-06-01', kekayaanBersih: 41000000),
    WealthHistoryPoint(tanggal: '2026-07-01', kekayaanBersih: 42500000),
  ],
);
