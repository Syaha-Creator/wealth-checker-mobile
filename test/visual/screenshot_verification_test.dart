import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/auth/data/auth_repository.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/monthly_cash_flow.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction_categories.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/pages/transaction_form_page.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/providers/transactions_list_provider.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('visual verification goldens', () {
    testWidgets('login wrong password shows friendly message', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWith((_) => _FailingAuthRepository()),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('id')],
            home: const LoginPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byWidgetPredicate(
          (widget) => widget is FormBuilderTextField && widget.name == 'email',
        ),
        'user@example.com',
      );
      await tester.enterText(
        find.byWidgetPredicate(
          (widget) =>
              widget is FormBuilderTextField && widget.name == 'password',
        ),
        'wrongpassword123',
      );
      await tester.tap(find.widgetWithText(ElevatedButton, 'Masuk'));
      await tester.pumpAndSettle();

      expect(find.text('Email atau password salah.'), findsOneWidget);
      expect(find.textContaining('RequestOptions'), findsNothing);

      await expectLater(
        find.byType(LoginPage),
        matchesGoldenFile('goldens/login_wrong_password_error.png'),
      );
    });

    testWidgets('transaction form category chips use brand styling', (tester) async {
      const viewportHeight = 852.0;
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await _pumpTransactionForm(tester);
      await tester.pumpAndSettle();

      final chipsCapture = find.byKey(const Key('category_suggestion_chips_capture'));
      expect(chipsCapture, findsOneWidget);
      expect(find.byType(FilterChip), findsNothing);
      expect(find.byType(ActionChip), findsNothing);

      await tester.ensureVisible(chipsCapture);
      await tester.pumpAndSettle();
      expect(
        _isWithinViewport(tester, chipsCapture, viewportHeight),
        isTrue,
        reason: 'Category chips must be visible on screen',
      );
      expect(find.text('Gaji'), findsOneWidget);
      expect(find.text('Bonus'), findsOneWidget);
      expect(find.text('Freelance'), findsOneWidget);

      await expectLater(
        chipsCapture,
        matchesGoldenFile('goldens/transaction_form_category_chips.png'),
      );
    });

    testWidgets('transaction form nominal shows Rp prefix when empty and unfocused',
        (tester) async {
      const viewportHeight = 852.0;
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await _pumpTransactionForm(tester);
      await tester.pumpAndSettle();

      final nominalCapture = find.byKey(const Key('transaction_nominal_capture'));
      final nominalField = find.byKey(const Key('transaction_nominal_field'));
      expect(nominalCapture, findsOneWidget);
      expect(nominalField, findsOneWidget);

      await tester.ensureVisible(nominalCapture);
      await tester.pumpAndSettle();

      final nominalDecorator = find.descendant(
        of: nominalField,
        matching: find.byType(InputDecorator),
      );
      expect(nominalDecorator, findsOneWidget);
      expect(
        _isWithinViewport(tester, nominalCapture, viewportHeight),
        isTrue,
        reason: 'Nominal field must be visible on screen',
      );

      final decorator = tester.widget<InputDecorator>(nominalDecorator);
      expect(decorator.decoration.prefixText, 'Rp ');
      expect(
        decorator.decoration.floatingLabelBehavior,
        FloatingLabelBehavior.always,
      );
      expect(decorator.isFocused, isFalse);

      final rpPrefix = find.descendant(
        of: nominalCapture,
        matching: find.textContaining('Rp'),
      );
      expect(rpPrefix, findsOneWidget);
      expect(
        _isWithinViewport(tester, rpPrefix, viewportHeight),
        isTrue,
        reason: 'Rp prefix text must be visible on screen',
      );
      expect(
        _isWithinParent(tester, rpPrefix, nominalCapture),
        isTrue,
        reason: 'Rp prefix must render inside nominal field',
      );

      await expectLater(
        nominalCapture,
        matchesGoldenFile('goldens/transaction_form_nominal_empty.png'),
      );
    });

    testWidgets('dashboard breakdown colors', (tester) async {
      tester.view.physicalSize = const Size(400, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
            monthlyCashFlowProvider.overrideWith((_) async => _sampleCashFlow),
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

      await expectLater(
        find.byType(DashboardPage),
        matchesGoldenFile('goldens/dashboard_breakdown_colors.png'),
      );
    });
  });
}

Future<void> _pumpTransactionForm(WidgetTester tester) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        accountsListProvider.overrideWith(_SuccessAccountsList.new),
        transactionCategoriesProvider.overrideWith(
          (_) async => const TransactionCategories(
            pendapatan: ['Gaji', 'Bonus', 'Freelance'],
          ),
        ),
        wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
        monthlyCashFlowProvider.overrideWith((_) async => _sampleCashFlow),
        transactionsListProvider(const TransactionsFilter())
            .overrideWith(_EmptyTransactionsList.new),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('id')],
        home: const TransactionFormPage(type: TransactionType.pendapatan),
      ),
    ),
  );
}

bool _isWithinViewport(
  WidgetTester tester,
  Finder finder,
  double viewportHeight,
) {
  final box = tester.renderObject<RenderBox>(finder);
  final top = box.localToGlobal(Offset.zero).dy;
  final bottom = top + box.size.height;
  return top >= 0 && bottom <= viewportHeight;
}

bool _isWithinParent(
  WidgetTester tester,
  Finder child,
  Finder parent,
) {
  final childBox = tester.renderObject<RenderBox>(child);
  final parentBox = tester.renderObject<RenderBox>(parent);
  final childTopLeft = childBox.localToGlobal(Offset.zero);
  final childBottomRight = childBox.localToGlobal(childBox.size.bottomRight(Offset.zero));
  final parentTopLeft = parentBox.localToGlobal(Offset.zero);
  final parentBottomRight = parentBox.localToGlobal(parentBox.size.bottomRight(Offset.zero));
  return childTopLeft.dx >= parentTopLeft.dx &&
      childTopLeft.dy >= parentTopLeft.dy &&
      childBottomRight.dx <= parentBottomRight.dx &&
      childBottomRight.dy <= parentBottomRight.dy;
}

class _FailingAuthRepository extends AuthRepository {
  _FailingAuthRepository() : super(_UnusedDio());

  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    throw const ApiException(
      statusCode: 401,
      message: 'Email atau password salah.',
    );
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _SuccessAccountsList extends AccountsList {
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

class _EmptyTransactionsList extends TransactionsList {
  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async => [];
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

const _sampleCashFlow = MonthlyCashFlow(
  bulanIni: MonthSnapshot(
    bulan: '2026-07',
    pemasukan: 10000000,
    pengeluaran: 7500000,
    sisaUangBulanan: 2500000,
  ),
  bulanLalu: MonthSnapshot(
    bulan: '2026-06',
    pemasukan: 9500000,
    pengeluaran: 8000000,
    sisaUangBulanan: 1500000,
  ),
  rataRata3Bulan: RollingAverage(
    pemasukan: 9800000,
    pengeluaran: 7700000,
    sisaUangBulanan: 2100000,
  ),
  hidupTanpaGajiBulan: 6.5,
  usedProfileFallback: false,
);
