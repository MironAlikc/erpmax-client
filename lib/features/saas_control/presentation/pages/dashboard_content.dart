import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/subscriptions_bar_chart.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/charts/revenue_line_chart.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/chart_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/widgets/common/app_base_stat_card.dart';
import '../../../dashboard/data/datasources/dashboard_local_datasource.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;
  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final l10n = AppLocalizations.of(context);
    final bool isStacked = screenWidth < 1200;

    final summaryData = DashboardLocalDataSourceImpl(
      colors: theme,
    ).getSummaryData();

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: summaryData.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 170,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              final item = summaryData[index];
              return AppBaseStatCard(
                title: item.title,
                value: _formatCurrency(item.value, item.currency),
                icon: _getLucideIcon(item.title),
                trailing: StatTrendBadge(
                  trend:
                      "${item.changePercentage > 0 ? '+' : ''}${item.changePercentage}%",
                  isPositive: item.changePercentage == 0
                      ? null
                      : item.changePercentage > 0,
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          DashboardChartsSection(isStacked: isStacked, l10n: l10n),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  IconData _getLucideIcon(String title) {
    final t = title.toLowerCase().trim();
    if (t.contains('revenue') || t.contains('mrr') || t.contains('expenses')) {
      return LucideIcons.dollarSign;
    }
    if (t.contains('churn')) return LucideIcons.trendingDown;
    if (t.contains('customer') || t.contains('retention')) {
      return LucideIcons.users;
    }
    if (t.contains('performance') || t.contains('system')) {
      return LucideIcons.activity;
    }
    return LucideIcons.barChart3;
  }

  String _formatCurrency(double value, String? currency) {
    final String formattedValue = value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
    return currency != null ? "$currency $formattedValue" : formattedValue;
  }
}

class DashboardChartsSection extends StatelessWidget {
  final bool isStacked;
  final dynamic l10n;

  const DashboardChartsSection({
    super.key,
    required this.isStacked,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final charts = [
      ChartWrapper(title: l10n.totalRevenue, chart: const RevenueLineChart()),
      ChartWrapper(
        title: l10n.activeSubscriptions,
        chart: const SubscriptionsBarChart(),
      ),
    ];

    if (isStacked) {
      return Column(
        children: [charts[0], const SizedBox(height: 24), charts[1]],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: charts[0]),
        const SizedBox(width: 24),
        Expanded(child: charts[1]),
      ],
    );
  }
}
