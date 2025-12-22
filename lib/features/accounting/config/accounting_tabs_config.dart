import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/accounting/views/accounting_dashboard_view.dart';
import 'package:flutter/material.dart';

abstract final class AccountingTabsConfig {
  static List<ModuleTabItem> getTabs(
    Widget Function(String name) placeholderBuilder,
  ) {
    const int accountingShellIndex = 1;

    return [
      ModuleTabItem(
        id: 'acc_dashboard',
        name: 'Accounting Dashboard',
        icon: Icons.grid_view_outlined,
        shellIndex: accountingShellIndex,
        description: 'Manage labor costs and production analysis',
        content: const AccountingDashboardView(),
      ),
      ModuleTabItem(
        id: 'acc_ledger',
        name: 'General Ledger',
        icon: Icons.menu_book_outlined,
        shellIndex: accountingShellIndex,
        description: 'Detailed account records and balances.',
        content: placeholderBuilder("General Ledger"),
      ),
      ModuleTabItem(
        id: 'acc_journal',
        name: 'Journal Entries',
        icon: Icons.description_outlined,
        shellIndex: accountingShellIndex,
        description: 'Manage and review financial journal entries.',
        content: placeholderBuilder("Journal Entries"),
      ),
      ModuleTabItem(
        id: 'acc_chart',
        name: 'Chart of Accounts',
        icon: Icons.account_tree_outlined,
        shellIndex: accountingShellIndex,
        description: 'Review and organize your financial accounts',
        content: placeholderBuilder("Chart of Accounts"),
      ),
      ModuleTabItem(
        id: 'acc_funds',
        name: 'Funds & Banks',
        icon: Icons.account_balance_wallet_outlined,
        shellIndex: accountingShellIndex,
        description: 'Manage branch funds and track transactions',
        content: placeholderBuilder("Funds & Banks"),
      ),
      ModuleTabItem(
        id: 'acc_parties',
        name: 'Parties',
        icon: Icons.people_outline,
        shellIndex: accountingShellIndex,
        description: 'Manage customer and vendor accounts',
        content: placeholderBuilder("Parties"),
      ),
      ModuleTabItem(
        id: 'acc_assets',
        name: 'Ass',
        icon: Icons.apartment_outlined,
        shellIndex: accountingShellIndex,
        description: 'Track and manage company fixed assets',
        content: placeholderBuilder("Fixed Assets"),
      ),
    ];
  }
}
