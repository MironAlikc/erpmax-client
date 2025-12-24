import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/theme/app_scroll_behavior.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabNavigationService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ERPMax Client',
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
                  "Something went wrong. Please refresh.",
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
  }
}
