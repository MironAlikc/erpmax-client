import 'package:erpmax_client/core/widgets/common/app_base_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/dashboard/data/datasources/dashboard_local_datasource.dart';

class DashboardSummaryGrid extends StatelessWidget {
  final double screenWidth;

  const DashboardSummaryGrid({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final summaryData = DashboardLocalDataSourceImpl(
      colors: theme,
    ).getSummaryData();

    return GridView.builder(
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
        final data = summaryData[index];
        return AppBaseStatCard(
          title: data.title,
          value: _formatValue(data.value, data.currency),
          icon: _getIconForId(data.title),
          trailing: StatTrendBadge(
            trend:
                "${data.changePercentage > 0 ? '+' : ''}${data.changePercentage}%",
            isPositive: data.changePercentage == 0
                ? null
                : data.changePercentage > 0,
          ),
        );
      },
    );
  }

  String _formatValue(double value, String? currency) {
    final String formattedNumber = value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
    return currency != null ? "$currency $formattedNumber" : formattedNumber;
  }

  IconData _getIconForId(String title) {
    final t = title.toLowerCase();
    if (t.contains('mrr')) return Icons.attach_money_outlined;
    if (t.contains('churn')) return Icons.trending_down_outlined;
    if (t.contains('retention')) return Icons.group_outlined;
    if (t.contains('performance')) return Icons.show_chart_outlined;
    return Icons.bar_chart_outlined;
  }
}
