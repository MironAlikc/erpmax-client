import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Твои Core-файлы
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';

// Импорт контента
import 'package:erpmax_client/features/accounting/views/accounting_dashboard_view.dart';

class AccountingRootPage extends StatefulWidget {
  const AccountingRootPage({super.key});

  @override
  State<AccountingRootPage> createState() => _AccountingRootPageState();
}

class _AccountingRootPageState extends State<AccountingRootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Использование ID обязательно для связи с Backend API
  late final List<ModuleTabItem> _moduleTabs = [
    ModuleTabItem(
      id: 'acc_dashboard',
      name: 'Accounting Dashboard',
      icon: Icons.grid_view_outlined,
      description: 'Manage labor costs and production analysis',
      content: const AccountingDashboardView(),
      actionType: 'dashboard',
    ),
    ModuleTabItem(
      id: 'acc_journal',
      name: 'Journal Entries',
      icon: Icons.description_outlined,
      description: 'Manage and review financial journal entries.',
      content: _placeholder("Journal Entries"),
      actionType: 'journal',
    ),
    ModuleTabItem(
      id: 'acc_funds',
      name: 'Funds & Banks',
      icon: Icons.account_balance_wallet_outlined,
      description: 'Manage branch funds and track transactions',
      content: _placeholder("Funds & Banks"),
      actionType: 'funds',
    ),
    ModuleTabItem(
      id: 'acc_customers',
      name: 'Customers',
      icon: Icons.people_outline,
      description: 'Manage customer accounts and receivables',
      content: _placeholder("Customers"),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'acc_suppliers',
      name: 'Suppliers',
      icon: Icons.local_shipping_outlined,
      description: 'Manage vendor accounts and payables',
      content: _placeholder("Suppliers"),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'acc_chart',
      name: 'Chart of Accounts',
      icon: Icons.account_tree_outlined,
      description: 'Review and organize your financial accounts',
      content: _placeholder("Chart of Accounts"),
      actionType: 'none',
    ),
    ModuleTabItem(
      id: 'acc_assets',
      name: 'Fixed Assets',
      icon: Icons.apartment_outlined,
      description: 'Track and manage company fixed assets',
      content: _placeholder("Fixed Assets"),
      actionType: 'add',
    ),
    ModuleTabItem(
      id: 'acc_closure',
      name: 'Periodic Closure',
      icon: Icons.lock_clock_outlined,
      description: 'Handle monthly and yearly closing processes',
      content: _placeholder("Periodic Closure"),
      actionType: 'none',
    ),
    ModuleTabItem(
      id: 'acc_reports',
      name: 'Reports',
      icon: Icons.insert_drive_file_outlined,
      description: 'Generate and view financial reports',
      content: _placeholder("Reports"),
      actionType: 'dashboard',
    ),
    ModuleTabItem(
      id: 'acc_exchange',
      name: 'Cost Centers & Exchange',
      icon: Icons.currency_exchange_outlined,
      description: 'Manage cost distribution and currency rates',
      content: _placeholder("Cost Centers & Exchange"),
      actionType: 'none',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _moduleTabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          _moduleTabs,
          _tabController,
        );
      }
    });
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
          _AccountingHeader(currentTab: currentTab),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: context.isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: _moduleTabs.map((t) => t.content).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder(String name) => Center(
    child: Text(
      "$name Content Coming Soon",
      style: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray400),
    ),
  );
}

// --- Выделенный виджет Хедера ---
class _AccountingHeader extends StatelessWidget {
  final ModuleTabItem currentTab;

  const _AccountingHeader({required this.currentTab});

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
            _AccountingActions(currentTab: currentTab),
        ],
      ),
    );
  }
}

// --- Выделенный виджет кнопок действий ---
class _AccountingActions extends StatelessWidget {
  final ModuleTabItem currentTab;

  const _AccountingActions({required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Кнопки отчетов
        if (currentTab.actionType == 'dashboard' ||
            currentTab.id == 'acc_journal') ...[
          _ActionBtn(
            label: "Export Report",
            icon: Icons.ios_share_outlined,
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],

        // Специфические бухгалтерские кнопки
        if (currentTab.id == 'acc_journal' ||
            currentTab.id == 'acc_dashboard') ...[
          _ActionBtn(
            label: "Cash Journal",
            icon: Icons.account_balance_wallet_outlined,
            isPrimary: true,
            color: const Color(0xFF56D0A0),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          _ActionBtn(
            label: "Receipts",
            icon: Icons.arrow_downward,
            isPrimary: true,
            color: const Color(0xFF5AB38D),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          _ActionBtn(
            label: "Payments",
            icon: Icons.arrow_upward,
            isPrimary: true,
            color: AppColors.error,
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],

        // Главная кнопка действия
        _ActionBtn(
          label: currentTab.actionType == 'funds'
              ? "Add Fund"
              : "Journal Entry",
          icon: Icons.add,
          isPrimary: true,
          onPressed: () {},
        ),
      ],
    );
  }
}

// --- Универсальный компонент кнопки для бухгалтерии ---
class _ActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const _ActionBtn({
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
