import 'package:erpmax_client/core/navigation/go_router_refresh_stream.dart';
import 'package:erpmax_client/core/navigation/presentation/layout/dashboard_shell.dart';
import 'package:erpmax_client/core/navigation/router/fade_transition_page.dart';
import 'package:erpmax_client/features/accounting/presentation/pages/accounting_root_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/check_email_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/login_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/reset_password_new_password_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/reset_password_success_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/signup_page.dart';
import 'package:erpmax_client/features/auth/presentation/pages/verify_2fa_page.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/saas_admin_root_page.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  static const accounting = '/accounting';
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
  static final _shellDash = GlobalKey<NavigatorState>(debugLabel: 'db_dash');
  static final _shellAcc = GlobalKey<NavigatorState>(debugLabel: 'db_acc');
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

  static GoRouter createRouter(AuthBloc authBloc) => GoRouter(
    initialLocation: RouteNames.login,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    redirect: (context, state) {
      final location = state.matchedLocation;

      if (location == RouteNames.journal) return RouteNames.accounting;

      final bool isPublicAuthPage = [
        RouteNames.login,
        RouteNames.signup,
        RouteNames.forgotPassword,
        RouteNames.checkEmail,
        RouteNames.newPassword,
        RouteNames.passwordSuccess,
        RouteNames.verify2fa,
      ].contains(location);

      final authState = authBloc.state;
      final bool isAuthenticated = authState is AuthAuthenticated;

      print(
        'Redirect: location=$location, isPublicAuthPage=$isPublicAuthPage, isAuthenticated=$isAuthenticated',
      );

      if (location == RouteNames.root) return RouteNames.login;
      if (!isAuthenticated && !isPublicAuthPage) return RouteNames.login;
      if (isAuthenticated && location == RouteNames.login) {
        print('Redirecting to dashboard');
        return RouteNames.dashboard;
      }

      return null;
    },

    routes: [
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
        pageBuilder: (context, state) {
          final email = state.extra as String? ?? 'user@example.com';
          return FadeTransitionPage(
            key: state.pageKey,
            child: CheckEmailPage(email: email),
          );
        },
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

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          _createBranch(
            _shellDash,
            RouteNames.dashboard,
            const Center(child: Text('Main Dashboard')),
          ),
          StatefulShellBranch(
            navigatorKey: _shellAcc,
            routes: [
              GoRoute(
                path: RouteNames.accounting,
                builder: (context, state) => const AccountingRootPage(),
              ),
              GoRoute(
                path: RouteNames.journal,
                builder: (context, state) => const AccountingRootPage(),
              ),
            ],
          ),

          _createBranch(
            _shellInv,
            RouteNames.inventory,
            const Center(child: Text('Inventory')),
          ),
          _createBranch(
            _shellSls,
            RouteNames.sales,
            const Center(child: Text('Sales')),
          ),
          _createBranch(
            _shellCust,
            RouteNames.customers,
            const Center(child: Text('Customers')),
          ),
          _createBranch(
            _shellAst,
            RouteNames.assets,
            const Center(child: Text('Assets')),
          ),
          _createBranch(
            _shellPos,
            RouteNames.pos,
            const Center(child: Text('POS')),
          ),
          _createBranch(
            _shellEx,
            RouteNames.exchange,
            const Center(child: Text('Exchange')),
          ),
          _createBranch(
            _shellPur,
            RouteNames.purchases,
            const Center(child: Text('Purchases')),
          ),
          _createBranch(
            _shellMan,
            RouteNames.manufacturing,
            const Center(child: Text('Manufacturing')),
          ),
          _createBranch(
            _shellHr,
            RouteNames.hr,
            const Center(child: Text('HR')),
          ),

          StatefulShellBranch(
            navigatorKey: _shellSaas,
            routes: [
              GoRoute(
                path: RouteNames.saasAdmin,
                builder: (context, state) => const SaaSAdminRootPage(),
              ),
            ],
          ),

          _createBranch(
            _shellAna,
            RouteNames.analytics,
            const Center(child: Text('Analytics')),
          ),
          _createBranch(
            _shellAuth,
            RouteNames.authGallery,
            const Center(child: Text('Auth Gallery')),
          ),
          _createBranch(
            _shellSet,
            RouteNames.settings,
            const Center(child: Text('Settings')),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );

  static StatefulShellBranch _createBranch(
    GlobalKey<NavigatorState> key,
    String path,
    Widget child,
  ) {
    return StatefulShellBranch(
      navigatorKey: key,
      routes: [GoRoute(path: path, builder: (context, state) => child)],
    );
  }
}
