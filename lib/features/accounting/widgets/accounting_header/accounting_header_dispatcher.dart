import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/accounting_dashboard_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/chart_of_accounts_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/fixed_assets_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/funds_and_banks_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/general_ladger_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/journal_entries_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/headers/parties_header.dart';
import 'package:flutter/material.dart';

class AccountingHeaderDispatcher extends StatelessWidget {
  final ModuleTabItem currentTab;

  const AccountingHeaderDispatcher({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    switch (currentTab.id) {
      case 'acc_dashboard':
        return AccountingDashboardHeader(currentTab: currentTab);
      case 'acc_ledger':
        return GeneralLedgerHeader(currentTab: currentTab);
      case 'acc_journal':
        return JournalEntriesHeader(currentTab: currentTab);
      case 'acc_chart':
        return ChartOfAccountsHeader(currentTab: currentTab);
      case 'acc_funds':
        return FundsAndBanksHeader(currentTab: currentTab);
      case 'acc_parties':
        return PartiesHeader(currentTab: currentTab);
      case 'acc_assets':
        return FixedAssetsHeader(currentTab: currentTab);
      default:
        return AccountingDashboardHeader(currentTab: currentTab);
    }
  }
}
