import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation/app_sidebar.dart';

class DashboardDesktopLayout extends StatefulWidget {
  final Widget child;

  const DashboardDesktopLayout({super.key, required this.child});

  @override
  State<DashboardDesktopLayout> createState() => _DashboardDesktopLayoutState();
}

class _DashboardDesktopLayoutState extends State<DashboardDesktopLayout> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Боковое меню (Sidebar)
          AppSidebar(
            isExpanded: _isExpanded,
            selectedIndex: 0, // Позже привяжем к GoRouter
            onSelect: (index) {},
          ),
          Expanded(
            child: Column(
              children: [
                // 1. УНИВЕРСАЛЬНАЯ ВЕРХНЯЯ ПАНЕЛЬ
                // Она будет всегда на месте при переходах
                const TopNavigationBar(isMobile: false),

                // 2. КОНТЕНТ СТРАНИЦЫ
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9FAFB),
                    child: widget
                        .child, // Сюда подставляется AccountingRootPage и др.
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
