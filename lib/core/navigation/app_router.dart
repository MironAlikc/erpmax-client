import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// --- Core & Components ---
import 'package:erpmax_client/core/navigation/fade_transition_page.dart';

// --- Auth Features ---
import 'package:erpmax_client/features/auth/presentation/pages/login_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/signup_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/check_email_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/reset_password_new_password_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/reset_password_success_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/verify_2fa_page.dart';

// --- Main Modules ---
import 'package:erpmax_client/features/dashboard/presentation/pages/dashboard_shell.dart';
import 'package:erpmax_client/features/accounting/pages/accounting_root_page.dart';
import 'package:erpmax_client/features/saas_admin/presentation/pages/saas_admin_root_page.dart';

/// Список имен всех маршрутов приложения
abstract final class RouteNames {
  static const root = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const checkEmail = '/check-email';
  static const newPassword = '/new-password';
  static const passwordSuccess = '/password-success';
  static const verify2fa = '/verify-2fa';

  static const dashboard = '/dashboard';
  static const journal = '/journal';
  static const inventory = '/inventory';
  static const sales = '/sales';
  static const customers = '/customers';
  static const assets = '/assets';
  static const pos = '/pos';
  static const exchange = '/exchange';
  static const purchases = '/purchases';
  static const manufacturing = '/manufacturing';
  static const hr = '/hr';
  static const saasAdmin = '/saas-admin';
  static const analytics = '/analytics';
  static const authGallery = '/auth-gallery';
  static const settings = '/settings';
}

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  // Ключи для веток навигации (StatefulShellRoute)
  static final _shellDash = GlobalKey<NavigatorState>(debugLabel: 'db_dash');
  static final _shellJour = GlobalKey<NavigatorState>(debugLabel: 'db_jour');
  static final _shellInv = GlobalKey<NavigatorState>(debugLabel: 'db_inv');
  static final _shellSls = GlobalKey<NavigatorState>(debugLabel: 'db_sls');
  static final _shellCust = GlobalKey<NavigatorState>(debugLabel: 'db_cust');
  static final _shellAst = GlobalKey<NavigatorState>(debugLabel: 'db_ast');
  static final _shellPos = GlobalKey<NavigatorState>(debugLabel: 'db_pos');
  static final _shellEx = GlobalKey<NavigatorState>(debugLabel: 'db_ex');
  static final _shellPur = GlobalKey<NavigatorState>(debugLabel: 'db_pur');
  static final _shellMan = GlobalKey<NavigatorState>(debugLabel: 'db_man');
  static final _shellHr = GlobalKey<NavigatorState>(debugLabel: 'db_hr');
  static final _shellSaas = GlobalKey<NavigatorState>(debugLabel: 'db_saas');
  static final _shellAna = GlobalKey<NavigatorState>(debugLabel: 'db_ana');
  static final _shellAuth = GlobalKey<NavigatorState>(debugLabel: 'db_auth');
  static final _shellSet = GlobalKey<NavigatorState>(debugLabel: 'db_set');

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final bool loggingIn = state.matchedLocation == RouteNames.login;
      final bool registering = state.matchedLocation == RouteNames.signup;

      // Публичные страницы (доступны без логина)
      final bool isPublicAuthPage =
          loggingIn ||
          registering ||
          state.matchedLocation == RouteNames.forgotPassword ||
          state.matchedLocation == RouteNames.checkEmail ||
          state.matchedLocation == RouteNames.newPassword ||
          state.matchedLocation == RouteNames.passwordSuccess ||
          state.matchedLocation == RouteNames.verify2fa;

      const bool isAuthenticated = true;

      if (state.matchedLocation == RouteNames.root) return RouteNames.login;

      // Если не залогинен и пытается зайти на закрытую страницу — на логин
      if (!isAuthenticated && !isPublicAuthPage) {
        return RouteNames.login;
      }

      // Если залогинен и пытается зайти на логин — на дашборд
      if (isAuthenticated && loggingIn) {
        return RouteNames.dashboard;
      }

      return null;
    },

    routes: [
      // --- AUTH ROUTES ---
      GoRoute(
        path: RouteNames.login,
        pageBuilder: (context, state) =>
            FadeTransitionPage(key: state.pageKey, child: const LoginPage()),
      ),
      GoRoute(
        path: RouteNames.signup,
        pageBuilder: (context, state) =>
            FadeTransitionPage(key: state.pageKey, child: const SignupPage()),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.checkEmail,
        pageBuilder: (context, state) =>
            FadeTransitionPage(key: state.pageKey, child: CheckEmailPage()),
      ),
      GoRoute(
        path: RouteNames.newPassword,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const ResetPasswordNewPasswordPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.passwordSuccess,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const ResetPasswordSuccessPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.verify2fa,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const Verify2faPage(),
        ),
      ),

      // --- MAIN SHELL (STATEFUL NAVIGATION) ---
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellDash,
            routes: [
              GoRoute(
                path: RouteNames.dashboard,
                builder: (context, state) =>
                    const Center(child: Text('Main Dashboard')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellJour,
            routes: [
              GoRoute(
                path: RouteNames.journal,
                builder: (context, state) => const AccountingRootPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellInv,
            routes: [
              GoRoute(
                path: RouteNames.inventory,
                builder: (context, state) =>
                    const Center(child: Text('Inventory')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSls,
            routes: [
              GoRoute(
                path: RouteNames.sales,
                builder: (context, state) => const Center(child: Text('Sales')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellCust,
            routes: [
              GoRoute(
                path: RouteNames.customers,
                builder: (context, state) =>
                    const Center(child: Text('Customers')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellAst,
            routes: [
              GoRoute(
                path: RouteNames.assets,
                builder: (context, state) =>
                    const Center(child: Text('Assets')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellPos,
            routes: [
              GoRoute(
                path: RouteNames.pos,
                builder: (context, state) => const Center(child: Text('POS')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellEx,
            routes: [
              GoRoute(
                path: RouteNames.exchange,
                builder: (context, state) =>
                    const Center(child: Text('Exchange')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellPur,
            routes: [
              GoRoute(
                path: RouteNames.purchases,
                builder: (context, state) =>
                    const Center(child: Text('Purchases')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellMan,
            routes: [
              GoRoute(
                path: RouteNames.manufacturing,
                builder: (context, state) =>
                    const Center(child: Text('Manufacturing')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellHr,
            routes: [
              GoRoute(
                path: RouteNames.hr,
                builder: (context, state) => const Center(child: Text('HR')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSaas,
            routes: [
              GoRoute(
                path: RouteNames.saasAdmin,
                builder: (context, state) => const SaaSAdminRootPage(
                  moduleIcon: Icons.admin_panel_settings,
                  moduleTitle: 'SaaS Admin',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellAna,
            routes: [
              GoRoute(
                path: RouteNames.analytics,
                builder: (context, state) =>
                    const Center(child: Text('Analytics')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellAuth,
            routes: [
              GoRoute(
                path: RouteNames.authGallery,
                builder: (context, state) =>
                    const Center(child: Text('Auth Gallery')),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSet,
            routes: [
              GoRoute(
                path: RouteNames.settings,
                builder: (context, state) =>
                    const Center(child: Text('Settings')),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
