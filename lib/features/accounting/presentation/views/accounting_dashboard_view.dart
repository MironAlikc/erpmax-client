import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_header/accounting_header_btn.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounts_watchlist.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/dashboard_this_month/dashboard_this_month.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/recent_transactions_table.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccountingDashboardView extends StatelessWidget {
  final String title;

  const AccountingDashboardView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final bool isMobile = MediaQuery.of(context).size.width < 1100;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Wrap(
            spacing: 20,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  title,
                  style: AppTextStyles.h1.copyWith(
                    color: theme.textPrimary,
                    fontSize: 26,
                  ),
                  softWrap: true,
                ),
              ),

              LayoutBuilder(
                builder: (context, headerConstraints) {
                  if (MediaQuery.of(context).size.width < 400) {
                    return const SizedBox.shrink();
                  }

                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 32,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AccountingHeaderBtn(
                            label: localizations.accCustomize,
                            icon: LucideIcons.slidersHorizontal,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.accReceipts,
                            icon: LucideIcons.arrowDownLeft,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.accPayments,
                            icon: LucideIcons.arrowUpRight,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.accCashJournal,
                            icon: LucideIcons.wallet,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.transfer,
                            icon: LucideIcons.arrowLeftRight,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.accExchange,
                            icon: LucideIcons.refreshCcw,
                            isOutline: true,
                          ),
                          const SizedBox(width: 12),
                          AccountingHeaderBtn(
                            label: localizations.accJournalEntry,
                            icon: LucideIcons.plus,
                            color: theme.sidebarActiveIcon,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          DashboardThisMonth(),
          // const SizedBox(height: 24),
          // const StatsGrid(),
          const SizedBox(height: 32),

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
