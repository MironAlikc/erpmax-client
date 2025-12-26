import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/revenue_line_chart.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/subscriptions_bar_chart.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/chart_wrapper.dart';
import 'package:flutter/material.dart';

class AnalyticsSection extends StatelessWidget {
  final bool stackCharts;

  const AnalyticsSection({super.key, required this.stackCharts});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Flex(
      direction: stackCharts ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: stackCharts ? 0 : 1,
          child: ChartWrapper(
            title: localizations.totalRevenue,
            chart: RevenueLineChart(),
          ),
        ),
        _buildSpacing(),
        Expanded(
          flex: stackCharts ? 0 : 1,
          child: ChartWrapper(
            title: localizations.activeSubscriptions,
            chart: SubscriptionsBarChart(),
          ),
        ),
      ],
    );
  }

  Widget _buildSpacing() {
    return stackCharts ? const SizedBox(height: 24) : const SizedBox(width: 24);
  }
}
