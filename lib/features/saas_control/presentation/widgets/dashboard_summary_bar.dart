import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:erpmax_client/core/utils/responsive.dart';

enum TimePeriodType { today, week, month, quarter, year }

extension TimePeriodLabel on TimePeriodType {
  String label(BuildContext context) {
    switch (this) {
      case TimePeriodType.today:
        return "Today";
      case TimePeriodType.week:
        return "This Week";
      case TimePeriodType.month:
        return "This Month";
      case TimePeriodType.quarter:
        return "This Quarter";
      case TimePeriodType.year:
        return "This Year";
    }
  }
}

class DashboardSummaryBar extends StatefulWidget {
  const DashboardSummaryBar({super.key});

  @override
  State<DashboardSummaryBar> createState() => _DashboardSummaryBarState();
}

class _DashboardSummaryBarState extends State<DashboardSummaryBar> {
  TimePeriodType selectedTimePeriod = TimePeriodType.month;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      constraints: BoxConstraints(minHeight: isDesktop ? 80 : 0),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 16 : 12,
      ),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isDesktop) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Overview",
                  style: TextStyle(
                    color: theme.gray900,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                _buildPeriodSelector(context, theme),
              ],
            ),
            const SizedBox(height: 16),
          ],
          _buildLayout(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context, bool isDesktop) {
    final theme = context.theme.appColor;

    if (isDesktop) {
      return Row(
        children: [
          _buildStatItem(
            context,
            icon: LucideIcons.dollarSign,
            title: "MRR",
            value: "SAR 125,000",
            percentage: "+ 12.5 %",
            isPositive: true,
            iconSymbolColor: const Color(0xFF10B981),
            valueColor: const Color(0xFF10B981),
          ),
          _buildDivider(true),
          _buildStatItem(
            context,
            icon: LucideIcons.users,
            title: "Subscribers",
            value: "342",
            percentage: "+ 8.2 %",
            isPositive: true,
            iconSymbolColor: const Color(0xFF64748B),
          ),
          _buildDivider(true),
          _buildStatItem(
            context,
            icon: LucideIcons.trendingDown,
            title: "Churn Rate",
            value: "2.4 %",
            percentage: "- 0.5 %",
            isPositive: false,
            iconSymbolColor: const Color(0xFFF59E0B),
            valueColor: const Color(0xFFF59E0B),
          ),
          _buildDivider(true),
          _buildStatItem(
            context,
            icon: LucideIcons.server,
            title: "Uptime",
            value: "99.99 %",
            percentage: "",
            isPositive: true,
            iconSymbolColor: const Color(0xFF10B981),
            valueColor: const Color(0xFF10B981),
          ),
          const Spacer(),
          _buildPeriodSelector(context, theme),
        ],
      );
    } else {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
        childAspectRatio: Responsive.isMobile(context) ? 4.0 : 3.0,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildStatItem(
            context,
            icon: LucideIcons.dollarSign,
            title: "MRR",
            value: "SAR 125,000",
            percentage: "+ 12.5 %",
            isPositive: true,
            iconSymbolColor: const Color(0xFF10B981),
            valueColor: const Color(0xFF10B981),
          ),
          _buildStatItem(
            context,
            icon: LucideIcons.users,
            title: "Subscribers",
            value: "342",
            percentage: "+ 8.2 %",
            isPositive: true,
            iconSymbolColor: const Color(0xFF64748B),
          ),
          _buildStatItem(
            context,
            icon: LucideIcons.trendingDown,
            title: "Churn Rate",
            value: "2.4 %",
            percentage: "- 0.5 %",
            isPositive: false,
            iconSymbolColor: const Color(0xFFF59E0B),
            valueColor: const Color(0xFFF59E0B),
          ),
          _buildStatItem(
            context,
            icon: LucideIcons.server,
            title: "Uptime",
            value: "99.99 %",
            percentage: "",
            isPositive: true,
            iconSymbolColor: const Color(0xFF10B981),
            valueColor: const Color(0xFF10B981),
          ),
        ],
      );
    }
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required String percentage,
    required bool isPositive,
    required Color iconSymbolColor,
    Color? valueColor,
  }) {
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: isMobile ? 20 : 22,
          color: iconSymbolColor.withOpacity(0.7),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.gray500,
                  fontSize: isMobile ? 11 : 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        color: valueColor ?? const Color(0xFF0F172A),
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (percentage.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      Text(
                        percentage,
                        style: const TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isHorizontal) {
    return Container(
      height: isHorizontal ? 32 : 1,
      width: isHorizontal ? 1 : double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: isHorizontal ? 24 : 0,
        vertical: isHorizontal ? 0 : 12,
      ),
      color: const Color(0xFFF1F5F9),
    );
  }

  Widget _buildPeriodSelector(BuildContext context, dynamic theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(LucideIcons.calendar, size: 14, color: theme.gray400),
        const SizedBox(width: 6),
        Text(
          selectedTimePeriod.label(context),
          style: TextStyle(
            color: theme.gray600,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 2),
        Icon(LucideIcons.chevronDown, size: 12, color: theme.gray400),
      ],
    );
  }
}
