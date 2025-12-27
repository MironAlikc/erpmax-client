import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/dashboard_this_month/this_month_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardThisMonth extends StatelessWidget {
  const DashboardThisMonth({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      color: theme.bgLight,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Icon(LucideIcons.calendar, color: theme.textSecondary),
              ),
              const SizedBox(height: 8),
              Text(
                "This Month",
                style: TextStyle(color: theme.textPrimary, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConstrainedCard(Widget card) {
    return SizedBox(width: 200, height: 50, child: card);
  }
}
