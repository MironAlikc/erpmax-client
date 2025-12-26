import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/accounting/presentation/views/accounting_dashboard_view.dart';
import 'package:flutter/material.dart';

abstract final class AccountingTabsConfig {
  static List<ModuleTabItem> getTabs(
    BuildContext content,
    Widget Function(String name) placeholderBuilder,
  ) {
    final localizations = AppLocalizations.of(content);
    const int accountingShellIndex = 1;

    return [
      ModuleTabItem(
        id: 'acc_dashboard',
        name: localizations.accDashboard,
        icon: Icons.grid_view_outlined,
        shellIndex: accountingShellIndex,
        // description: 'Обзор финансовых показателей и аналитика производства',
        content: const AccountingDashboardView(),
      ),
      ModuleTabItem(
        id: 'acc_ledger',
        name: localizations.accLedger,
        icon: Icons.menu_book_outlined,
        shellIndex: accountingShellIndex,
        // description: 'Детальные записи по счетам и остаткам (Главная книга).',
        content: placeholderBuilder("General Ledger"),
      ),
      ModuleTabItem(
        id: 'acc_journal',
        name: localizations.accJournal,
        icon: Icons.description_outlined,
        shellIndex: accountingShellIndex,
        // description: 'Управление и просмотр записей в финансовом журнале.',
        content: placeholderBuilder("Journal Entries"),
      ),
      ModuleTabItem(
        id: 'acc_chart',
        name: localizations.accChart,
        icon: Icons.account_tree_outlined,
        shellIndex: accountingShellIndex,
        // description: 'План счетов: организация финансовой структуры компании.',
        content: placeholderBuilder("Chart of Accounts"),
      ),
      ModuleTabItem(
        id: 'acc_funds',
        name: localizations.accFunds,
        icon: Icons.account_balance_wallet_outlined,
        shellIndex: accountingShellIndex,
        // description:
        //     'Управление кассовыми фондами и отслеживание банковских транзакций.',
        content: placeholderBuilder("Funds & Banks"),
      ),
      ModuleTabItem(
        id: 'acc_parties',
        name: localizations.accParties,
        icon: Icons.people_outline,
        shellIndex: accountingShellIndex,
        // description: 'Управление счетами клиентов и поставщиков (Контрагенты).',
        content: placeholderBuilder("Parties"),
      ),
      ModuleTabItem(
        id: 'acc_assets',
        name: localizations.accAssets,
        icon: Icons.apartment_outlined,
        shellIndex: accountingShellIndex,
        // description: 'Отслеживание и управление основными средствами компании.',
        content: placeholderBuilder("Fixed Assets"),
      ),
    ];
  }
}
