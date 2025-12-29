import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/accounting/presentation/views/accounting_dashboard_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/general_ledger_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/journal_entries_view.dart';
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
        content: AccountingDashboardView(title: localizations.accDashboard),
      ),
      ModuleTabItem(
        id: 'acc_ledger',
        name: localizations.accLedger,
        icon: Icons.menu_book_outlined,
        shellIndex: accountingShellIndex,
        content: GeneralLedgerView(title: "General Ledger"),
      ),
      ModuleTabItem(
        id: 'acc_journal',
        name: localizations.accJournal,
        icon: Icons.description_outlined,
        shellIndex: accountingShellIndex,
        content: JournalEntriesView(title: "Journal Entries"),
      ),
      ModuleTabItem(
        id: 'acc_chart',
        name: localizations.accChart,
        icon: Icons.account_tree_outlined,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Chart of Accounts"),
      ),
      ModuleTabItem(
        id: 'acc_funds',
        name: localizations.accFunds,
        icon: Icons.account_balance_wallet_outlined,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Funds & Banks"),
      ),
      ModuleTabItem(
        id: 'acc_parties',
        name: localizations.accParties,
        icon: Icons.people_outline,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Parties"),
      ),
      ModuleTabItem(
        id: 'acc_assets',
        name: localizations.accAssetsCenters,
        icon: Icons.apartment_outlined,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Accets & Centers"),
      ),
      ModuleTabItem(
        id: 'acc_closing',
        name: localizations.accPeriodClosing,
        icon: Icons.apartment_outlined,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Period Closing"),
      ),
      ModuleTabItem(
        id: 'acc_reports',
        name: localizations.accReports,
        icon: Icons.apartment_outlined,
        shellIndex: accountingShellIndex,
        content: placeholderBuilder("Reprts"),
      ),
    ];
  }
}
