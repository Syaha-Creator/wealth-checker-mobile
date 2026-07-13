import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/assets/data/models/fixed_asset_holding.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/pages/fixed_assets_page.dart';
import 'package:wealth_checker_mobile/features/assets/presentation/providers/fixed_asset_holdings_provider.dart';

void main() {
  group('FixedAssetsPage', () {
    testWidgets('renders active holdings with total value', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _SuccessFixedHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Laptop'), findsOneWidget);
      expect(find.textContaining('Jumlah: 1'), findsOneWidget);
      expect(find.textContaining('HPP rata-rata'), findsOneWidget);
      expect(find.textContaining('Total nilai'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no holdings', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _EmptyFixedHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada aset tetap'), findsOneWidget);
    });

    testWidgets('shows edit and delete actions for each holding', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _SuccessFixedHoldings.new),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('edit_asset_fix-1')), findsOneWidget);
      expect(find.byKey(const Key('delete_asset_fix-1')), findsOneWidget);
    });

    testWidgets('delete shows confirmation dialog', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(holdingsOverride: _DeletableFixedHoldings.new),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('delete_asset_fix-1')));
      await tester.pumpAndSettle();

      expect(find.text('Hapus aset tetap?'), findsOneWidget);
      expect(find.text('Batal'), findsOneWidget);
      expect(find.text('Hapus'), findsWidgets);
    });
  });
}

Widget _buildTestApp({
  required FixedAssetHoldings Function() holdingsOverride,
}) {
  return ProviderScope(
    overrides: [
      fixedAssetHoldingsProvider.overrideWith(holdingsOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const FixedAssetsPage(),
    ),
  );
}

const _sampleHolding = FixedAssetHolding(
  id: 'fix-1',
  userId: 'user-1',
  namaAset: 'Laptop',
  jumlah: 1,
  hargaBeliRataRata: 12000000,
  updatedAt: '2026-07-01T00:00:00.000Z',
);

class _SuccessFixedHoldings extends FixedAssetHoldings {
  @override
  Future<List<FixedAssetHolding>> build() async => const [_sampleHolding];
}

class _EmptyFixedHoldings extends FixedAssetHoldings {
  @override
  Future<List<FixedAssetHolding>> build() async => const [];
}

class _DeletableFixedHoldings extends FixedAssetHoldings {
  @override
  Future<List<FixedAssetHolding>> build() async => const [_sampleHolding];

  @override
  Future<void> deleteAsset(String id) async {}
}
