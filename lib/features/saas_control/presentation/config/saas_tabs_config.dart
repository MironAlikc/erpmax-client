import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/presentation/app_menu_type_config.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/access_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/backup_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/view/billing_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/module_management_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/packages_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/reports_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/subscribers_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/visitor_logs_content.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/dashboard_content.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

abstract final class SaasTabsConfig {
  static List<ModuleTabItem> getTabs(
    BuildContext content,
    Widget Function(String name) placeholderBuilder,
  ) {
    final localizations = AppLocalizations.of(content);
    final saasIndex = AppMenuConfig.getIndexByType(
      AppMenuType.saasControl,
      localizations,
    );

    return [
      ModuleTabItem(
        id: 'saas_dashboard',
        name: 'SaaS Dashboard',
        icon: Icons.grid_view_outlined,
        shellIndex: saasIndex,
        // description: 'System performance overview and real-time metrics.',
        content: Builder(
          builder: (context) =>
              DashboardContent(screenWidth: MediaQuery.of(context).size.width),
        ),
        actionType: 'dashboard',
      ),
      ModuleTabItem(
        id: 'saas_reports',
        name: 'Reports',
        icon: Icons.insert_drive_file_outlined,
        shellIndex: saasIndex,
        // description: 'Detailed analytical statistics and exports.',
        content: ReportsContent(),
        actionType: 'report',
      ),
      ModuleTabItem(
        id: 'saas_subscribers',
        name: 'Subscribers',
        icon: Icons.people_outline_rounded,
        shellIndex: saasIndex,
        // description: 'Manage your customer base and subscriptions.',
        content: SubscribersContent(),
        actionType: 'add',
      ),
      ModuleTabItem(
        id: 'saas_packages',
        name: 'Packages',
        icon: Icons.inventory_2_outlined,
        shellIndex: saasIndex,
        // description: 'Pricing plans and module bundles.',
        content: PackagesContent(),
        actionType: 'add',
      ),
      ModuleTabItem(
        id: 'saas_billing',
        name: 'Billing',
        icon: LucideIcons.receipt,
        shellIndex: saasIndex,
        // description: 'Manage invoices, payments, and discount coupons',
        content: BillingView(title: localizations.billingManagement),
        actionType: 'add',
      ),
      ModuleTabItem(
        id: 'saas_modules',
        name: 'Module Management',
        icon: Icons.token_outlined,
        shellIndex: saasIndex,
        // description: 'Feature control and system extensions.',
        content: ModuleManagementContent(),
        actionType: 'add',
      ),
      ModuleTabItem(
        id: 'saas_backup',
        name: 'Backup Management',
        icon: Icons.storage_outlined,
        shellIndex: saasIndex,
        // description: 'Database security and snapshot history.',
        content: BackupContent(),
      ),
      ModuleTabItem(
        id: 'saas_visitor_logs',
        name: 'Visitor Logs',
        icon: Icons.analytics_outlined,
        shellIndex: saasIndex,
        // description: 'Real-time visitor tracking and IP analytics.',
        content: VisitorLogsContent(),
      ),
      ModuleTabItem(
        id: 'saas_access_logs',
        name: 'Access Logs',
        icon: Icons.history_toggle_off_outlined,
        shellIndex: saasIndex,
        // description: 'Security audit trails and user activity.',
        content: AccessLogsContent(),
      ),
    ];
  }
}
