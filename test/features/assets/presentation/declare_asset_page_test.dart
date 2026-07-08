import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/liquid_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/pages/declare_asset_page.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/liquid_asset_holdings_provider.dart';

void main() {
  group('DeclareAssetPage', () {
    testWidgets('submits liquid declare without account field', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Sudah Dimiliki (Investasi)'), findsOneWidget);
      expect(find.text('Rekening'), findsNothing);

      await tester.enterText(find.byKey(const Key('declare_nama_aset_field')), 'Emas Antam');
      await tester.enterText(find.byKey(const Key('declare_jumlah_field')), '5');
      await tester.enterText(find.byKey(const Key('declare_harga_field')), '1000000');

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(_lastDeclaredNama, 'Emas Antam');
    });
  });
}

String? _lastDeclaredNama;

Widget _buildTestApp() {
  final router = GoRouter(
    initialLocation: '/declare',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(body: Text('home')),
      ),
      GoRoute(
        path: '/declare',
        builder: (context, state) =>
            const DeclareAssetPage(kind: DeclareAssetKind.liquid),
      ),
    ],
  );

  return ProviderScope(
    overrides: [
      liquidAssetHoldingsProvider.overrideWith(_RecordingLiquidHoldings.new),
    ],
    child: MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
    ),
  );
}

class _RecordingLiquidHoldings extends LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async => const [];

  @override
  Future<void> declareAsset({
    required String namaAset,
    required double jumlah,
    required double hargaBeliRataRata,
  }) async {
    _lastDeclaredNama = namaAset;
  }
}
