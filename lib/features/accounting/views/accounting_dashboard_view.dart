import 'package:erpmax_client/features/accounting/widgets/accounts_watchlist.dart';
import 'package:erpmax_client/features/accounting/widgets/quick_actions_panel.dart';
import 'package:erpmax_client/features/accounting/widgets/recent_transactions_table.dart';
import 'package:erpmax_client/features/accounting/widgets/stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_design.dart';

class AccountingDashboardView extends StatelessWidget {
  const AccountingDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1100;

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        children: [
          const StatsGrid(),
          const SizedBox(height: 32),
          if (isMobile)
            Column(
              children: const [
                RecentTransactionsTable(),
                SizedBox(height: 24),
                QuickActionsPanel(),
                SizedBox(height: 24),
                AccountsWatchlist(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 2, child: RecentTransactionsTable()),
                const SizedBox(width: 24),
                const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      QuickActionsPanel(),
                      SizedBox(height: 24),
                      AccountsWatchlist(),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
