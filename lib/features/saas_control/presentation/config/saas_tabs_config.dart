import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/access_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/backup_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/module_management_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/packages_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/reports_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/subscribers_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/visitor_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/dashboard_content.dart';
import 'package:flutter/material.dart';

class SaasTabsConfig {
  static const int saasShellIndex = 11;

  static List<ModuleTabItem> getTabs(BuildContext context) {
    return [
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
  }
}
