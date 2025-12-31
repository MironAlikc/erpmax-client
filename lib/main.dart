import 'package:erpmax_client/core/di/injection.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/l10n/locale_cubit.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/theme/app_scroll_behavior.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  usePathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabNavigationService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<LocaleCubit>()),
          BlocProvider(create: (_) => getIt<ThemeCubit>()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, currentLocale) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context).appTitle,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: currentLocale,
              themeMode: themeMode,
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              debugShowCheckedModeBanner: false,
              scrollBehavior: AppScrollBehavior(),
              routerConfig: AppRouter.router,
              restorationScopeId: 'erpmax_app',
              builder: (context, child) {
                ErrorWidget.builder = (FlutterErrorDetails details) {
                  return Material(
                    child: Container(
                      color: context.theme.appColor.white,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).errorGeneral,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: context.theme.appColor.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                };
                return child!;
              },
            );
          },
        );
      },
    );
  }
}
