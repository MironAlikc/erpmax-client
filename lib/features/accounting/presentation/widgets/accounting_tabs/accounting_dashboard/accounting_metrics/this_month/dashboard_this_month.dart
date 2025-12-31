import 'package:erpmax_client/core/extensions/dropdown_ext.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/this_month/this_month_card.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum TimePeriodType { today, week, month, quarter, year }

class DashboardThisMonth extends StatefulWidget {
  const DashboardThisMonth({super.key});

  @override
  State<DashboardThisMonth> createState() => _DashboardThisMonthState();
}

class _DashboardThisMonthState extends State<DashboardThisMonth> {
  TimePeriodType selectedTimePeriod = TimePeriodType.month;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildConstrainedCard(
                  ThisMonthCard(
                    title: localizations.totalRevenue,
                    amount: '\$124 500',
                    percentage: '+12.5%',
                    isPositive: true,
                    icon: LucideIcons.trendingUp,
                    color: theme.sidebarActiveIcon,
                  ),
                ),
                _buildConstrainedCard(
                  ThisMonthCard(
                    title: localizations.totalExpenses,
                    amount: '\$45 200',
                    percentage: '-2.4%',
                    isPositive: false,
                    icon: LucideIcons.trendingDown,
                    color: theme.textSecondary,
                  ),
                ),
                _buildConstrainedCard(
                  ThisMonthCard(
                    title: localizations.netProfit,
                    amount: '\$79 300',
                    percentage: '+4.2%',
                    isPositive: true,
                    icon: LucideIcons.wallet,
                    color: theme.textSecondary,
                  ),
                ),
                _buildConstrainedCard(
                  ThisMonthCard(
                    title: localizations.cashFlow,
                    amount: '\$32 000',
                    percentage: '+5.1%',
                    isPositive: true,
                    icon: LucideIcons.arrowLeftRight,
                    color: theme.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),
          AccDropdown(
            value: selectedTimePeriod,
            items: TimePeriodType.values,
            itemLabelBuilder: (val) => val.label(context),
            leadingIcon: LucideIcons.calendar,
            onChanged: (TimePeriodType newValue) {
              setState(() {
                selectedTimePeriod = newValue;
              });
            },
            isBg: false,
          ),
        ],
      ),
    );
  }

  Widget _buildConstrainedCard(Widget card) {
    return SizedBox(width: 200, height: 46, child: card);
  }
}
