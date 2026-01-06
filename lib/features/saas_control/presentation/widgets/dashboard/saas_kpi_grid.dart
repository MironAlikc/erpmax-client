import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../shared/saas_kpi_card.dart';
import '../shared/saas_status_indicators.dart';

class SaasKpiGrid extends StatelessWidget {
  const SaasKpiGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.7,
      children: [
        SaasKpiCard(
          title: "Monthly Revenue",
          value: "SAR 125,000",
          target: "150,000",
          icon: LucideIcons.dollarSign,
          color: const Color(0xFF14B8A6),
          footer: const KpiTrendIndicator(trend: "+ 12.5 %", isPositive: true),
        ),
        SaasKpiCard(
          title: "Churn Rate",
          value: "2.4 %",
          target: "< 2 %",
          icon: LucideIcons.trendingDown,
          color: theme.warning,
          footer: KpiStatusIndicator(
            label: "Needs Improvement",
            color: theme.warning,
          ),
        ),
        SaasKpiCard(
          title: "Retention Rate",
          value: "98.2 %",
          target: "> 95 %",
          icon: LucideIcons.users,
          color: theme.gray900,
          footer: const KpiProgressBar(progress: 0.98),
        ),
        SaasKpiCard(
          title: "System Uptime",
          value: "99.99 %",
          target: "> 99.9 %",
          icon: LucideIcons.server,
          color: theme.success,
          footer: KpiStatusIndicator(
            label: "All Systems Operational",
            color: theme.success,
            useCheck: true,
          ),
        ),
      ],
    );
  }
}
