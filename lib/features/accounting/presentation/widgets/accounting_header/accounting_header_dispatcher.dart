// class AccountingHeaderDispatcher extends StatelessWidget {
//   final ModuleTabItem currentTab;

//   const AccountingHeaderDispatcher({super.key, required this.currentTab});

//   @override
//   Widget build(BuildContext context) {
//     switch (currentTab.id) {
//       case 'acc_dashboard':
//         return AccountingDashboardHeader(currentTab: currentTab);
//       case 'acc_ledger':
//         return GeneralLedgerHeader(currentTab: currentTab);
//       case 'acc_journal':
//         return JournalEntriesHeader(currentTab: currentTab);
//       case 'acc_chart':
//         return ChartOfAccountsHeader(currentTab: currentTab);
//       case 'acc_funds':
//         return FundsAndBanksHeader(currentTab: currentTab);
//       case 'acc_parties':
//         return PartiesHeader(currentTab: currentTab);
//       case 'acc_assets':
//         return FixedAssetsHeader(currentTab: currentTab);
//       default:
//         return AccountingDashboardHeader(currentTab: currentTab);
//     }
//   }
// }
