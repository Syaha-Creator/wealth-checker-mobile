import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/accounts/data/models/account.dart';
import '../../features/accounts/presentation/pages/account_form_page.dart';
import '../../features/accounts/presentation/pages/account_mutation_page.dart';
import '../../features/accounts/presentation/pages/accounts_list_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../core/navigation/main_shell.dart';
import '../../features/transactions/data/models/transaction.dart';
import '../../features/transactions/presentation/pages/transaction_form_page.dart';
import '../../features/transactions/presentation/pages/transactions_list_page.dart';
import '../../features/debts_receivables/data/models/debt.dart';
import '../../features/debts_receivables/data/models/receivable.dart';
import '../../features/debts_receivables/presentation/pages/debt_form_page.dart';
import '../../features/debts_receivables/presentation/pages/debts_list_page.dart';
import '../../features/debts_receivables/presentation/pages/receivable_form_page.dart';
import '../../features/debts_receivables/presentation/pages/receivables_list_page.dart';
import '../../features/assets/data/models/fixed_asset_holding.dart';
import '../../features/assets/data/models/liquid_asset_holding.dart';
import '../../features/assets/presentation/pages/asset_form_page.dart';
import '../../features/assets/presentation/pages/declare_asset_page.dart';
import '../../features/assets/presentation/pages/fixed_assets_page.dart';
import '../../features/assets/presentation/pages/liquid_assets_page.dart';
import '../../features/health_checkup/presentation/pages/health_checkup_page.dart';
import '../../features/budgeting/presentation/pages/budgeting_advisor_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/dream_tracker/data/models/dream_goal.dart';
import '../../features/dream_tracker/presentation/pages/dream_goal_form_page.dart';
import '../../features/dream_tracker/presentation/pages/dream_goals_page.dart';
import '../../features/retirement_plan/presentation/pages/retirement_plan_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../shared/providers/auth_state_provider.dart';

part 'app_router.g.dart';

const _authRoutes = {'/login', '/register', '/forgot-password'};

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshListenable = ValueNotifier<int>(0);

  ref.listen(
    authStateProvider,
    (previous, next) => refreshListenable.value++,
  );

  ref.onDispose(refreshListenable.dispose);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authAsync = ref.read(authStateProvider);
      final location = state.matchedLocation;

      if (authAsync.isLoading) {
        return null;
      }

      final status = authAsync.value;
      if (status == null) {
        return null;
      }

      final isAuthRoute = _authRoutes.contains(location);

      if (status == AuthStatus.unauthenticated && !isAuthRoute) {
        return '/login';
      }

      if (status == AuthStatus.authenticated && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainShell(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/accounts',
        builder: (context, state) => const AccountsListPage(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const AccountFormPage(),
          ),
          GoRoute(
            path: ':id/edit',
            builder: (context, state) => AccountFormPage(
              account: state.extra as Account?,
            ),
          ),
          GoRoute(
            path: ':id/mutasi',
            builder: (context, state) => AccountMutationPage(
              accountId: state.pathParameters['id']!,
              accountName: state.uri.queryParameters['nama'],
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/transactions',
        builder: (context, state) => const TransactionsListPage(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) {
              final query = state.uri.queryParameters;
              return TransactionFormPage(
                type: TransactionTypeX.fromQuery(query['type']),
                relatedDebtId: query['relatedDebtId'],
                relatedReceivableId: query['relatedReceivableId'],
                prefilledNamaAset: query['namaAset'],
              );
            },
          ),
          GoRoute(
            path: ':id/edit',
            builder: (context, state) => TransactionFormPage(
              transactionId: state.pathParameters['id']!,
              transaction: state.extra as Transaction?,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/debts',
        builder: (context, state) => const DebtsListPage(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const DebtFormPage(),
          ),
          GoRoute(
            path: ':id/edit',
            builder: (context, state) => DebtFormPage(
              debt: state.extra as Debt?,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/receivables',
        builder: (context, state) => const ReceivablesListPage(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const ReceivableFormPage(),
          ),
          GoRoute(
            path: ':id/edit',
            builder: (context, state) => ReceivableFormPage(
              receivable: state.extra as Receivable?,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/assets/liquid',
        builder: (context, state) => const LiquidAssetsPage(),
        routes: [
          GoRoute(
            path: ':id/edit',
            builder: (context, state) {
              final holding = state.extra as LiquidAssetHolding;
              return AssetFormPage(
                kind: DeclareAssetKind.liquid,
                holdingId: holding.id,
                initialNamaAset: holding.namaAset,
                initialJumlah: holding.jumlah,
                initialHargaBeliRataRata: holding.hargaBeliRataRata,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/assets/fixed',
        builder: (context, state) => const FixedAssetsPage(),
        routes: [
          GoRoute(
            path: ':id/edit',
            builder: (context, state) {
              final holding = state.extra as FixedAssetHolding;
              return AssetFormPage(
                kind: DeclareAssetKind.fixed,
                holdingId: holding.id,
                initialNamaAset: holding.namaAset,
                initialJumlah: holding.jumlah,
                initialHargaBeliRataRata: holding.hargaBeliRataRata,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/assets/declare',
        builder: (context, state) {
          final kind = state.uri.queryParameters['kind'] == 'fixed'
              ? DeclareAssetKind.fixed
              : DeclareAssetKind.liquid;
          return DeclareAssetPage(kind: kind);
        },
      ),
      GoRoute(
        path: '/health-checkup',
        builder: (context, state) => const HealthCheckupPage(),
      ),
      GoRoute(
        path: '/budgeting',
        builder: (context, state) => const BudgetingAdvisorPage(),
      ),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => const AnalyticsPage(),
      ),
      GoRoute(
        path: '/dream-goals',
        builder: (context, state) => const DreamGoalsPage(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const DreamGoalFormPage(),
          ),
          GoRoute(
            path: ':id/edit',
            builder: (context, state) => DreamGoalFormPage(
              goal: state.extra as DreamGoal?,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/retirement-plan',
        builder: (context, state) => const RetirementPlanPage(),
      ),
    ],
  );
}
