import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/presentation/app_menu_type_config.dart';
import 'package:erpmax_client/features/accounting/presentation/views/accounting_dashboard_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/chart_of_accounts_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/funds_banks_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/general_ledger_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/journal_entries_view.dart';
import 'package:erpmax_client/features/accounting/presentation/views/parties_view.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

abstract final class AccountingTabsConfig {
  static List<ModuleTabItem> getTabs(
    BuildContext content,
    Widget Function(String name) placeholderBuilder,
  ) {
    final localizations = AppLocalizations.of(content);
    final accountingIndex = AppMenuConfig.getIndexByType(
      AppMenuType.accounting,
      localizations,
    );

    return [
      ModuleTabItem(
        id: 'acc_dashboard',
        name: localizations.accDashboard,
        icon: LucideIcons.layoutDashboard,
        shellIndex: accountingIndex,
        content: AccountingDashboardView(title: localizations.accDashboard),
      ),
      ModuleTabItem(
        id: 'acc_ledger',
        name: localizations.accLedger,
        icon: LucideIcons.book,
        shellIndex: accountingIndex,
        content: GeneralLedgerView(title: localizations.accLedger),
      ),
      ModuleTabItem(
        id: 'acc_journal',
        name: localizations.accJournal,
        icon: LucideIcons.fileText,
        shellIndex: accountingIndex,
        content: JournalEntriesView(title: localizations.accJournal),
      ),
      ModuleTabItem(
        id: 'acc_chart',
        name: localizations.accChart,
        icon: LucideIcons.network,
        shellIndex: accountingIndex,
        content: ChartOfAccountsView(title: localizations.accChart),
      ),
      ModuleTabItem(
        id: 'acc_funds',
        name: localizations.accFunds,
        icon: LucideIcons.wallet,
        shellIndex: accountingIndex,
        content: FundsBanksView(title: localizations.accFunds),
      ),
      ModuleTabItem(
        id: 'acc_parties',
        name: localizations.accParties,
        icon: Icons.people_outline,
        shellIndex: accountingIndex,
        content: PartiesView(title: localizations.accParties),
      ),
      ModuleTabItem(
        id: 'acc_reports',
        name: localizations.reports,
        icon: LucideIcons.fileText,
        shellIndex: accountingIndex,
        content: placeholderBuilder("Reprts"),
      ),
      ModuleTabItem(
        id: 'acc_settings',
        name: localizations.accAccountingSettings,
        icon: LucideIcons.settings,
        shellIndex: accountingIndex,
        content: placeholderBuilder("Accounting Settings"),
      ),
    ];
  }
}
