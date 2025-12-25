import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/navigation/app_sidebar.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/navigation/top_nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardDesktopLayout extends StatefulWidget {
  final Widget child;

  const DashboardDesktopLayout({super.key, required this.child});

  @override
  State<DashboardDesktopLayout> createState() => _DashboardDesktopLayoutState();
}

class _DashboardDesktopLayoutState extends State<DashboardDesktopLayout> {
  bool _isExpanded = true;

  void _toggleSidebar() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppSidebar(
            isExpanded: _isExpanded,
            selectedIndex: 0,
            onToggle: _toggleSidebar,
            onSelect: (index) {},
          ),
          Expanded(
            child: Column(
              children: [
                TopNavigationBar(
                  isMobile: false,
                  isSidebarExpanded: _isExpanded,
                  onToggleSidebar: _toggleSidebar,
                ),
                Expanded(
                  child: Container(
                    color: context.theme.appColor.gray50,
                    child: widget.child,
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
