import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/liquid_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/pages/liquid_assets_page.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/liquid_asset_holdings_provider.dart';

void main() {
  group('LiquidAssetsPage', () {
    testWidgets('renders active holdings with total value', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _SuccessLiquidHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Reksa Dana Saham'), findsOneWidget);
      expect(find.textContaining('Jumlah: 10'), findsOneWidget);
      expect(find.textContaining('HPP rata-rata'), findsOneWidget);
      expect(find.textContaining('Total nilai'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no holdings', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _EmptyLiquidHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada investasi'), findsOneWidget);
    });

    testWidgets('shows edit and delete actions for each holding', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _SuccessLiquidHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('edit_asset_liq-1')), findsOneWidget);
      expect(find.byKey(const Key('delete_asset_liq-1')), findsOneWidget);
    });

    testWidgets('delete shows confirmation dialog', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _DeletableLiquidHoldings.new),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('delete_asset_liq-1')));
      await tester.pumpAndSettle();

      expect(find.text('Hapus investasi?'), findsOneWidget);
      expect(find.text('Batal'), findsOneWidget);
      expect(find.text('Hapus'), findsWidgets);
    });
  });
}

Widget _buildTestApp({
  required LiquidAssetHoldings Function() holdingsOverride,
}) {
  return ProviderScope(
    overrides: [
      liquidAssetHoldingsProvider.overrideWith(holdingsOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const LiquidAssetsPage(),
    ),
  );
}

const _sampleHolding = LiquidAssetHolding(
  id: 'liq-1',
  userId: 'user-1',
  namaAset: 'Reksa Dana Saham',
  jumlah: 10,
  hargaBeliRataRata: 15000,
  updatedAt: '2026-07-01T00:00:00.000Z',
);

class _SuccessLiquidHoldings extends LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async => const [_sampleHolding];
}

class _EmptyLiquidHoldings extends LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async => const [];
}

class _DeletableLiquidHoldings extends LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async => const [_sampleHolding];

  @override
  Future<void> deleteAsset(String id) async {}
}
