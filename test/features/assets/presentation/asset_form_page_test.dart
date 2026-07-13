import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/liquid_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/pages/asset_form_page.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/pages/declare_asset_page.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/liquid_asset_holdings_provider.dart';

void main() {
  group('AssetFormPage', () {
    testWidgets('submits liquid asset update with changed jumlah', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Edit Investasi'), findsOneWidget);
      expect(find.byKey(const Key('asset_edit_jumlah_field')), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('asset_edit_jumlah_field')),
        '20',
      );
      await tester.tap(find.byKey(const Key('asset_edit_submit_btn')));
      await tester.pumpAndSettle();

      expect(_lastUpdatedJumlah, 20);
    });
  });
}

double? _lastUpdatedJumlah;

Widget _buildTestApp() {
  final router = GoRouter(
    initialLocation: '/edit',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(body: Text('list')),
      ),
      GoRoute(
        path: '/edit',
        builder: (context, state) => const AssetFormPage(
          kind: DeclareAssetKind.liquid,
          holdingId: 'liq-1',
          initialNamaAset: 'Reksa Dana Saham',
          initialJumlah: 10,
          initialHargaBeliRataRata: 15000,
        ),
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
  Future<void> updateAsset({
    required String id,
    String? namaAset,
    double? jumlah,
    double? hargaBeliRataRata,
  }) async {
    _lastUpdatedJumlah = jumlah;
  }
}
