import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/tab_chip_bar.dart';
import '../widgets/navigation/app_sidebar.dart';

class DashboardShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardShell({super.key, required this.navigationShell});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final tabService = Provider.of<TabNavigationService>(context);

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            AppSidebar(
              isExpanded: _isExpanded,
              selectedIndex: widget.navigationShell.currentIndex,
              onSelect: (index) => widget.navigationShell.goBranch(index),
            ),
          Expanded(
            child: Column(
              children: [
                TopNavigationBar(isMobile: !isDesktop),
                if (tabService.tabs.isNotEmpty && tabService.controller != null)
                  TabChipBar(
                    controller: tabService.controller!,
                    tabs: tabService.tabs,
                    isMobile: !isDesktop,
                  ),

                Expanded(
                  child: Container(
                    color: const Color(0xFFF9FAFB),
                    child: widget.navigationShell,
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
