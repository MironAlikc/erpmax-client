import 'package:erpmax_client/features/dashboard/presentation/widgets/main_content/main_content_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:erpmax_client/core/widgets/common/tab_chip_bar.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/mobile/mobile_drawer.dart';
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
    final int currentIndex = widget.navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: AppColors.gray50,
      drawer: !isDesktop
          ? MobileDrawer(
              selectedIndex: currentIndex,
              onSelect: (index) => _onBranchSelected(index),
            )
          : null,
      body: Row(
        children: [
          if (isDesktop)
            AppSidebar(
              isExpanded: _isExpanded,
              selectedIndex: currentIndex,
              onToggle: () => setState(() => _isExpanded = !_isExpanded),
              onSelect: (index) => _onBranchSelected(index),
            ),
          Expanded(
            child: Column(
              children: [
                TopNavigationBar(
                  isMobile: !isDesktop,
                  isSidebarExpanded: _isExpanded,
                  onToggleSidebar: () {
                    if (isDesktop)
                      setState(() => _isExpanded = !_isExpanded);
                    else
                      Scaffold.of(context).openDrawer();
                  },
                ),
                MainContentHeader(
                  title: _getModuleTitle(currentIndex),
                  isDashboard: currentIndex == 0,
                ),
                Consumer<TabNavigationService>(
                  builder: (context, tabService, _) {
                    if (tabService.tabs.isEmpty ||
                        tabService.controller == null) {
                      return const SizedBox.shrink();
                    }
                    return TabChipBar(
                      controller: tabService.controller!,
                      tabs: tabService.tabs,
                      isMobile: !isDesktop,
                      onTabSelected: (index) => tabService.selectTab(index),
                    );
                  },
                ),
                Expanded(child: ClipRect(child: widget.navigationShell)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onBranchSelected(int index) {
    context.read<TabNavigationService>().clear();
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  String _getModuleTitle(int index) {
    return switch (index) {
      0 => 'Dashboard',
      1 => 'Accounting',
      11 => 'SaaS Control',
      14 => 'Settings',
      _ => 'ERP Module',
    };
  }
}
