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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isExpanded = true;

  @override
  void didUpdateWidget(DashboardShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncTabsWithNavigation();
  }

  void _syncTabsWithNavigation() {
    final tabService = Provider.of<TabNavigationService>(
      context,
      listen: false,
    );
    final currentIndex = widget.navigationShell.currentIndex;
    tabService.updateActiveTabByShellIndex(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final tabService = Provider.of<TabNavigationService>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.gray50,
      drawer: !isDesktop
          ? MobileDrawer(
              selectedIndex: widget.navigationShell.currentIndex,
              onSelect: (index) {
                widget.navigationShell.goBranch(index);
                Navigator.pop(context);
              },
            )
          : null,
      body: Row(
        children: [
          if (isDesktop)
            AppSidebar(
              isExpanded: _isExpanded,
              selectedIndex: widget.navigationShell.currentIndex,
              onToggle: () => setState(() => _isExpanded = !_isExpanded),
              onSelect: (index) {
                widget.navigationShell.goBranch(
                  index,
                  initialLocation: index == widget.navigationShell.currentIndex,
                );
              },
            ),
          Expanded(
            child: Column(
              children: [
                TopNavigationBar(
                  isMobile: !isDesktop,
                  isSidebarExpanded: _isExpanded,
                  onToggleSidebar: () {
                    if (isDesktop) {
                      setState(() => _isExpanded = !_isExpanded);
                    } else {
                      _scaffoldKey.currentState?.openDrawer();
                    }
                  },
                ),
                if (tabService.tabs.isNotEmpty && tabService.controller != null)
                  TabChipBar(
                    controller: tabService.controller!,
                    tabs: tabService.tabs,
                    isMobile: !isDesktop,
                    onTabSelected: (index) {
                      final targetBranchIndex =
                          tabService.tabs[index].shellIndex;
                      widget.navigationShell.goBranch(targetBranchIndex);
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
}
