import 'package:erpmax_client/features/accounting/widgets/accounts_watchlist.dart';
import 'package:erpmax_client/features/accounting/widgets/quick_actions_panel.dart';
import 'package:erpmax_client/features/accounting/widgets/recent_transactions_table.dart';
import 'package:erpmax_client/features/accounting/widgets/stats_grid.dart';
import 'package:flutter/material.dart';

class AccountingDashboardView extends StatelessWidget {
  const AccountingDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const StatsGrid(),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 2, child: RecentTransactionsTable()),
              const SizedBox(width: 24),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
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
