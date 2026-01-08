import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import '../shared/saas_kpi_card.dart';
import '../shared/saas_status_indicators.dart';

class SaasMetricsGrid extends StatelessWidget {
  const SaasMetricsGrid({super.key, required this.columns});

  final int columns;

  static const double _cardHeight = 200;
  static const double _spacing = 20;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final metrics = _getSaasMetrics(theme);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final itemWidth = (maxWidth - (_spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: _spacing,
          runSpacing: _spacing,
          children: metrics.map((metric) {
            return SizedBox(
              width: itemWidth,
              height: _cardHeight,
              child: SaasKpiCard(
                title: metric.title,
                value: metric.value,
                target: metric.target,
                icon: metric.icon,
                color: metric.color,
                footer: metric.footer,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  List<SaasMetricData> _getSaasMetrics(dynamic theme) {
    return [
      SaasMetricData(
        title: "Monthly Revenue",
        value: "SAR 125,000",
        target: "Target: 150,000",
        icon: LucideIcons.dollarSign,
        color: const Color(0xFF14B8A6), // Teal
        footer: const KpiTrendIndicator(trend: "+ 12.5 %", isPositive: true),
      ),
      SaasMetricData(
        title: "Churn Rate",
        value: "2.4 %",
        target: "Target: < 2 %",
        icon: LucideIcons.trendingDown,
        color: theme.warning,
        footer: KpiStatusIndicator(
          label: "Needs Improvement",
          color: theme.warning,
        ),
      ),
      SaasMetricData(
        title: "Retention Rate",
        value: "98.2 %",
        target: "Target: > 95 %",
        icon: LucideIcons.users,
        color: theme.gray900,
        footer: const KpiProgressBar(progress: 0.98),
      ),
      SaasMetricData(
        title: "System Uptime",
        value: "99.99 %",
        target: "Target: > 99.9 %",
        icon: LucideIcons.server,
        color: theme.success,
        footer: KpiStatusIndicator(
          label: "All Systems Operational",
          color: theme.success,
          useCheck: true,
        ),
      ),
    ];
  }
}

class SaasMetricData {
  final String title;
  final String value;
  final String target;
  final IconData icon;
  final Color color;
  final Widget? footer;

  SaasMetricData({
    required this.title,
    required this.value,
    required this.target,
    required this.icon,
    required this.color,
    this.footer,
  });
}
