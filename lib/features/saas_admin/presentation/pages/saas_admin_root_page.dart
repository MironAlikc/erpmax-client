import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_search_field.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/dashboard/presentation/views/dashboard_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/backup_content.dart';
import '../pages/packages_content.dart';
import '../pages/reports_content.dart';
import '../pages/subscribers_content.dart';
import '../widgets/access_logs_content.dart';
import '../widgets/saas/module_management_content.dart';

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

class SaaSModuleHeader extends StatelessWidget {
  final ModuleTabItem currentTab;
  const SaaSModuleHeader({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(bottom: BorderSide(color: theme.gray100)),
      ),
      padding: EdgeInsets.fromLTRB(
        AppDesign.pagePadding,
        isMobile ? 12 : 24,
        AppDesign.pagePadding,
        isMobile ? 12 : 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentTab.name, style: AppTextStyles.h1),
                    if (!isMobile) ...[
                      const SizedBox(height: 4),
                      Text(
                        currentTab.description ?? '',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.gray500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: AppSearchField(
                    hintText: "Search in ${currentTab.name}...",
                    onChanged: (val) => debugPrint("Search: $val"),
                  ),
                ),
              ],
              if (!isMobile && currentTab.actionType != 'none') ...[
                const SizedBox(width: 24),
                _HeaderActions(currentTab: currentTab),
              ],
            ],
          ),
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppSearchField(hintText: "Search..."),
            ),
        ],
      ),
    );
  }
}

class _HeaderActions extends StatelessWidget {
  final ModuleTabItem currentTab;
  const _HeaderActions({required this.currentTab});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    if (currentTab.actionType == 'report') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ActionButton(
            label: "Print",
            icon: Icons.print_outlined,
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          _ActionButton(
            label: "Export",
            icon: Icons.file_download_outlined,
            isPrimary: true,
            color: theme.success,
            onPressed: () {},
          ),
        ],
      );
    }

    if (currentTab.actionType == 'add' ||
        currentTab.actionType == 'dashboard') {
      return _ActionButton(
        label: _getLabel(currentTab.id),
        icon: _getIcon(currentTab.id),
        isPrimary: true,
        onPressed: () {},
      );
    }

    return const SizedBox.shrink();
  }

  String _getLabel(String id) {
    if (id.contains('module')) return "New Module";
    if (id.contains('package')) return "Create Package";
    if (id.contains('subscriber')) return "Add Subscriber";
    return "Action";
  }

  IconData _getIcon(String id) {
    if (id.contains('subscriber')) return Icons.person_add_alt_1_outlined;
    return Icons.add;
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      height: 44,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? (color ?? const Color(0xFF12203A))
              : theme.white,
          foregroundColor: isPrimary ? theme.white : theme.textPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: isPrimary ? BorderSide.none : BorderSide(color: theme.gray200),
        ),
      ),
    );
  }
}
