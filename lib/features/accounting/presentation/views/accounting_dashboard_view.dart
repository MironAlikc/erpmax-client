import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_header/accounting_header.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/accounts_control_section/accounts_control_section.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/accounts_watchilst/accounts_watchlist.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/contra_indicators/contra_indications.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/financial_summary_section/financial_summary_section.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/pending_items/pending_items_card.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/recent_transactions/recent_transactions_table.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/this_month/dashboard_this_month.dart';
import 'package:flutter/material.dart';

class AccountingDashboardView extends StatelessWidget {
  final String title;

  const AccountingDashboardView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // === ContraIndicatorsMetrics ===
    const double cardMinWidth = 220;
    const double spacing = 16;
    const double horizontalPadding = AppDesign.pagePadding * 2;

    final double requiredWidthForFour =
        (cardMinWidth * 4) + (spacing * 3) + horizontalPadding;

    final int columns = screenWidth >= requiredWidthForFour ? 4 : 2;

    final bool isMobile = screenWidth < 1100;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AccountingHeader(title: title),
          const SizedBox(height: 16),
          DashboardThisMonth(),
          const SizedBox(height: 16),
          ContraIndicatorsMetrics(columns: columns),
          const SizedBox(height: 16),
          FinancialSummarySection(),
          const SizedBox(height: 16),
          AccountsControlSection(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: PendingItemsWidget()),
              SizedBox(width: 16),
              Expanded(child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 16),

          if (isMobile)
            Column(
              children: const [
                RecentTransactionsTable(),
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
                const Expanded(flex: 1, child: AccountsWatchlist()),
              ],
            ),
        ],
      ),
    );
  }
}
