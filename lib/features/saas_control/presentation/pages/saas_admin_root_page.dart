import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/access_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/backup_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/dashboard_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/module_management_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/packages_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/reports_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/subscribers_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/visitor_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/saas_module_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaaSAdminRootPage extends StatefulWidget {
  const SaaSAdminRootPage({super.key});

  @override
  State<SaaSAdminRootPage> createState() => _SaaSAdminRootPageState();
}

class _SaaSAdminRootPageState extends State<SaaSAdminRootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final List<ModuleTabItem> _moduleTabs;

  static const int saasShellIndex = 11;

  @override
  void initState() {
    super.initState();

    _moduleTabs = [
      ModuleTabItem(
        id: 'saas_dashboard',
        name: 'SaaS Dashboard',
        icon: Icons.grid_view_outlined,
        shellIndex: saasShellIndex,
        description: 'System performance overview and real-time metrics.',
        content: Builder(
          builder: (context) =>
              DashboardContent(screenWidth: MediaQuery.of(context).size.width),
        ),
        actionType: 'dashboard',
      ),
      const ModuleTabItem(
        id: 'saas_reports',
        name: 'Reports',
        icon: Icons.insert_drive_file_outlined,
        shellIndex: saasShellIndex,
        description: 'Detailed analytical statistics and exports.',
        content: ReportsContent(),
        actionType: 'report',
      ),
      const ModuleTabItem(
        id: 'saas_subscribers',
        name: 'Subscribers',
        icon: Icons.people_outline_rounded,
        shellIndex: saasShellIndex,
        description: 'Manage your customer base and subscriptions.',
        content: SubscribersContent(),
        actionType: 'add',
      ),
      const ModuleTabItem(
        id: 'saas_packages',
        name: 'Packages',
        icon: Icons.inventory_2_outlined,
        shellIndex: saasShellIndex,
        description: 'Pricing plans and module bundles.',
        content: PackagesContent(),
        actionType: 'add',
      ),
      const ModuleTabItem(
        id: 'saas_modules',
        name: 'Module Management',
        icon: Icons.token_outlined,
        shellIndex: saasShellIndex,
        description: 'Feature control and system extensions.',
        content: ModuleManagementContent(),
        actionType: 'add',
      ),
      const ModuleTabItem(
        id: 'saas_backup',
        name: 'Backup Management',
        icon: Icons.storage_outlined,
        shellIndex: saasShellIndex,
        description: 'Database security and snapshot history.',
        content: BackupContent(),
      ),
      const ModuleTabItem(
        id: 'saas_visitor_logs',
        name: 'Visitor Logs',
        icon: Icons.analytics_outlined,
        shellIndex: saasShellIndex,
        description: 'Real-time visitor tracking and IP analytics.',
        content: VisitorLogsContent(),
      ),
      const ModuleTabItem(
        id: 'saas_access_logs',
        name: 'Access Logs',
        icon: Icons.history_toggle_off_outlined,
        shellIndex: saasShellIndex,
        description: 'Security audit trails and user activity.',
        content: AccessLogsContent(),
      ),
    ];

    _tabController = TabController(length: _moduleTabs.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          _moduleTabs,
          _tabController,
          branchIndex: 11,
        );
      }
    });

    _tabController.addListener(() {
      if (mounted && !_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);
    final currentTab = _moduleTabs[_tabController.index];

    return Scaffold(
      backgroundColor: theme.gray50,
      body: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: SaaSModuleHeader(
              key: ValueKey(currentTab.id),
              currentTab: currentTab,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: _moduleTabs
                  .map((tab) => KeepAlivePage(child: tab.content))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// class _ActionButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onPressed;
//   final bool isPrimary;
//   final Color? color;

//   const _ActionButton(
//     this.color, {
//     required this.label,
//     required this.icon,
//     required this.onPressed,
//     required this.isPrimary,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return SizedBox(
//       height: 44,
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: Icon(icon, size: 18),
//         label: Text(label),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isPrimary
//               ? (color ?? const Color(0xFF12203A))
//               : theme.white,
//           foregroundColor: isPrimary ? theme.white : theme.textPrimary,
//           elevation: 0,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           side: isPrimary ? BorderSide.none : BorderSide(color: theme.gray200),
//         ),
//       ),
//     );
//   }
// }
