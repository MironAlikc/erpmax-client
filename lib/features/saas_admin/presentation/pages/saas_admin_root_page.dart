import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Импорт твоих core-файлов дизайна
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';

// Импорт контента (View/Pages)
import 'package:erpmax_client/features/dashboard/presentation/views/dashboard_content.dart';
import '../pages/reports_content.dart';
import '../pages/subscribers_content.dart';
import '../pages/packages_content.dart';
import '../widgets/saas/module_management_content.dart';
import '../pages/backup_content.dart';
import '../pages/visitor_logs_content.dart';
import '../pages/access_logs_content.dart';
import '../pages/permissions_content.dart';

class SaaSAdminRootPage extends StatefulWidget {
  final IconData moduleIcon;
  final String moduleTitle;

  const SaaSAdminRootPage({
    super.key,
    required this.moduleIcon,
    required this.moduleTitle,
  });

  @override
  State<SaaSAdminRootPage> createState() => _SaaSAdminRootPageState();
}

class _SaaSAdminRootPageState extends State<SaaSAdminRootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Инициализация вкладок с использованием ID (важно для API)
  late final List<ModuleTabItem> _moduleTabs = [
    ModuleTabItem(
      id: 'saas_dashboard',
      name: 'SaaS Dashboard',
      icon: Icons.grid_view_outlined,
      description: 'System performance overview.',
      content: Builder(
        builder: (context) =>
            DashboardContent(screenWidth: context.screenWidth),
      ),
      actionType: 'dashboard',
    ),
    ModuleTabItem(
      id: 'saas_reports',
      name: 'Reports',
      icon: Icons.insert_drive_file_outlined,
      description: 'Detailed analytical statistics.',
      content: const ReportsContent(),
      actionType: 'report',
    ),
    ModuleTabItem(
      id: 'saas_subscribers',
      name: 'Subscribers',
      icon: Icons.people_outline_rounded,
      description: 'Manage your customer base.',
      content: const SubscribersContent(),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'saas_packages',
      name: 'Packages',
      icon: Icons.inventory_2_outlined,
      description: 'Pricing and subscription plans.',
      content: const PackagesContent(),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'saas_modules',
      name: 'Module Management',
      icon: Icons.token_outlined,
      description: 'System feature control.',
      content: const ModuleManagementContent(),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'saas_backup',
      name: 'Backup Management',
      icon: Icons.storage_outlined,
      description: 'Database security and snapshots.',
      content: const BackupContent(),
      actionType: 'none',
    ),
    ModuleTabItem(
      id: 'saas_visitor_logs',
      name: 'Visitor Log',
      icon: Icons.language_outlined,
      description: 'Track user sessions.',
      content: const VisitorLogsContent(),
      actionType: 'none',
    ),
    ModuleTabItem(
      id: 'saas_access_logs',
      name: 'Access Logs',
      icon: Icons.history_toggle_off_outlined,
      description: 'Security and audit trails.',
      content: const AccessLogsContent(),
      actionType: 'none',
    ),
    ModuleTabItem(
      id: 'saas_permissions',
      name: 'Permissions',
      icon: Icons.shield_outlined,
      description: 'Role management.',
      content: const PermissionsContent(),
      actionType: 'none',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _moduleTabs.length, vsync: this);

    // Синхронизация с глобальным сервисом табов
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          _moduleTabs,
          _tabController,
        );
      }
    });

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (mounted && !_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = _moduleTabs[_tabController.index];

    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: Column(
        children: [
          // Динамический заголовок (вынесен в отдельный виджет ниже)
          SaaSModuleHeader(currentTab: currentTab),

          Expanded(
            child: TabBarView(
              key: ValueKey(_moduleTabs.length),
              controller: _tabController,
              physics: context.isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: _moduleTabs.map((tab) => tab.content).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Виджет заголовка страницы ---
class SaaSModuleHeader extends StatelessWidget {
  final ModuleTabItem currentTab;

  const SaaSModuleHeader({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDesign.pagePadding,
        context.isMobile ? 16 : 32,
        AppDesign.pagePadding,
        16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentTab.name, style: AppTextStyles.h1),
                const SizedBox(height: 8),
                Text(
                  currentTab.description ?? '',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),
          if (!context.isMobile && currentTab.actionType != 'none')
            _HeaderActions(currentTab: currentTab),
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
    if (currentTab.actionType == 'report') {
      return Row(
        children: [
          _ActionButton(
            label: "Print",
            icon: Icons.print_outlined,
            onPressed: () => _handleAction(context, "Print"),
          ),
          const SizedBox(width: 12),
          _ActionButton(
            label: "Export",
            icon: Icons.file_download_outlined,
            isPrimary: true,
            color: AppColors.success,
            onPressed: () => _handleAction(context, "Export"),
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
        onPressed: () => _handleAction(context, "Add/Edit"),
      );
    }

    return const SizedBox.shrink();
  }

  void _handleAction(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Action: $action for ${currentTab.name}")),
    );
  }

  String _getLabel(String id) {
    switch (id) {
      case 'saas_modules':
        return "Add Module";
      case 'saas_packages':
        return "Add Package";
      case 'saas_subscribers':
        return "Add Account";
      default:
        return "Edit Dashboard";
    }
  }

  IconData _getIcon(String id) {
    switch (id) {
      case 'saas_modules':
        return Icons.token_outlined;
      case 'saas_packages':
        return Icons.inventory_2_outlined;
      case 'saas_subscribers':
        return Icons.person_add_alt_1_outlined;
      default:
        return Icons.grid_view_rounded;
    }
  }
}

// --- Универсальная кнопка для хедера ---
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
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary
            ? (color ?? AppColors.primary)
            : AppColors.white,
        foregroundColor: isPrimary ? AppColors.white : AppColors.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
        ),
        side: isPrimary
            ? BorderSide.none
            : const BorderSide(color: AppColors.gray200),
        elevation: 0,
      ),
    );
  }
}
