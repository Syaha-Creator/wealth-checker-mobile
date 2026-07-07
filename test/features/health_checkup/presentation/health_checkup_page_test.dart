import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/health_checkup/data/models/health_checkup.dart';
import 'package:wealth_checker_mobile/features/health_checkup/presentation/pages/health_checkup_page.dart';
import 'package:wealth_checker_mobile/features/health_checkup/presentation/providers/health_checkup_provider.dart';

void main() {
  group('HealthCheckupPage', () {
    testWidgets('renders diagnosa, ciri, and saran on success', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Health Check-up'), findsOneWidget);
      expect(find.textContaining('Level 3'), findsOneWidget);
      expect(find.text('Diagnosa'), findsOneWidget);
      expect(find.textContaining('dana darurat'), findsWidgets);
      expect(find.text('Ciri-ciri'), findsOneWidget);
      expect(find.text('Saran'), findsOneWidget);
    });

    testWidgets('shows loading indicator while fetching', (tester) async {
      final completer = Completer<HealthCheckup>();
      await tester.pumpWidget(
        _buildTestApp(checkupFuture: completer.future),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      completer.complete(_sampleCheckup);
      await tester.pumpAndSettle();
    });

    testWidgets('shows error with retry on failure', (tester) async {
      await tester.pumpWidget(_buildTestApp(shouldFail: true));
      await tester.pumpAndSettle();

      expect(find.textContaining('Terjadi kesalahan'), findsOneWidget);
      expect(find.text('Coba lagi'), findsOneWidget);
    });
  });
}

Widget _buildTestApp({
  Future<HealthCheckup>? checkupFuture,
  bool shouldFail = false,
}) {
  return ProviderScope(
    overrides: [
      healthCheckupProvider.overrideWith((_) async {
        if (checkupFuture != null) {
          return checkupFuture;
        }
        if (shouldFail) {
          throw Exception('network error');
        }
        return _sampleCheckup;
      }),
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
      home: const HealthCheckupPage(),
    ),
  );
}

const _sampleCheckup = HealthCheckup(
  wealthLevel: 3,
  wealthLevelName: 'Gaji ke Gaji',
  diagnosa: 'Kekayaan bersih positif, namun belum ada dana darurat.',
  saran: 'Bangun dana darurat 3-6 bulan pengeluaran.',
  ciri: [
    'Kekayaan bersih positif',
    'Belum ada dana darurat memadai',
  ],
  kekayaanBersih: 5000000,
  totalAset: 6000000,
  totalUtang: 1000000,
);

const _sampleSummary = WealthSummary(
  userName: 'Test User',
  userEmail: 'test@example.com',
  totalKas: 1000000,
  totalLiquidAssets: 2000000,
  totalFixedAssets: 3000000,
  totalReceivables: 0,
  totalUtang: 1000000,
  totalAset: 6000000,
  kekayaanBersih: 5000000,
  wealthLevel: 3,
  wealthLevelName: 'Gaji ke Gaji',
);
