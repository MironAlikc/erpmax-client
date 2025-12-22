import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation/app_sidebar.dart';

class DashboardMobileLayout extends StatelessWidget {
  final Widget child;

  const DashboardMobileLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppSidebar(
          isExpanded: true,
          selectedIndex: 0,
          onToggle: () => Navigator.pop(context),
          onSelect: (index) {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TopNavigationBar(isMobile: true, isSidebarExpanded: true),
          Expanded(child: child),
        ],
      ),
    );
  }
}
