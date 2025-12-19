import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation/app_sidebar.dart';

class DashboardMobileLayout extends StatelessWidget {
  final Widget child;

  const DashboardMobileLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Подключаем ваш Sidebar в Drawer для мобилок
      drawer: Drawer(
        child: AppSidebar(
          isExpanded: true,
          selectedIndex: 0,
          onSelect: (index) {
            // Здесь можно добавить логику закрытия Drawer при нажатии
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Наша панель сама покажет иконку меню, если isMobile: true
          const TopNavigationBar(isMobile: true),

          Expanded(child: child),
        ],
      ),
    );
  }
}
