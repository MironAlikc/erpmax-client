import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

enum SaasTimePeriod { today, week, month, quarter, year }

extension SaasTimePeriodX on SaasTimePeriod {
  String label() {
    switch (this) {
      case SaasTimePeriod.today:
        return 'Today';
      case SaasTimePeriod.week:
        return 'This Week';
      case SaasTimePeriod.month:
        return 'This Month';
      case SaasTimePeriod.quarter:
        return 'This Quarter';
      case SaasTimePeriod.year:
        return 'This Year';
    }
  }
}

class SaasSummaryRibbon extends StatefulWidget {
  const SaasSummaryRibbon({super.key});

  @override
  State<SaasSummaryRibbon> createState() => _SaasSummaryRibbonState();
}

class _SaasSummaryRibbonState extends State<SaasSummaryRibbon> {
  SaasTimePeriod selectedPeriod = SaasTimePeriod.month;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.gray100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 0,
              runSpacing: 16,
              children: [
                _buildSummaryItem(
                  title: "MRR",
                  amount: "SAR 125,000",
                  percentage: "+ 12.5 %",
                  isPositive: true,
                  icon: LucideIcons.dollarSign,
                  iconColor: const Color(0xFF14B8A6),
                ),
                _buildSummaryItem(
                  title: "Subscribers",
                  amount: "342",
                  percentage: "+ 8.2 %",
                  isPositive: true,
                  icon: LucideIcons.users,
                  iconColor: theme.primary,
                ),
                _buildSummaryItem(
                  title: "Churn Rate",
                  amount: "2.4 %",
                  percentage: "- 0.5 %",
                  isPositive: false,
                  icon: LucideIcons.trendingDown,
                  iconColor: theme.warning,
                ),
                _buildSummaryItem(
                  title: "Uptime",
                  amount: "99.99 %",
                  isPositive: true,
                  icon: LucideIcons.server,
                  iconColor: theme.success,
                  isLast: true,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.calendar, size: 16, color: theme.gray500),
                const SizedBox(width: 8),
                Text(
                  selectedPeriod.label(),
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: theme.gray700,
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({
    required String title,
    required String amount,
    String? percentage,
    required bool isPositive,
    required IconData icon,
    required Color iconColor,
    bool isLast = false,
  }) {
    final theme = context.theme.appColor;

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.only(right: 32),
        margin: const EdgeInsets.only(right: 32),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(right: BorderSide(color: theme.gray100, width: 1.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: iconColor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.gray500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      amount,
                      style: AppTextStyles.h4.copyWith(
                        color: (title == "MRR" || title == "Uptime")
                            ? iconColor
                            : theme.gray900,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (percentage != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        percentage,
                        style: AppTextStyles.bodySmallBold.copyWith(
                          color: isPositive ? theme.success : theme.warning,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
