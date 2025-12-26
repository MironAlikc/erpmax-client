import 'package:erpmax_client/features/saas_control/presentation/widgets/components/chart_wrapper.dart';
import 'package:flutter/material.dart';
import '../charts/revenue_line_chart.dart';
import '../charts/subscriptions_bar_chart.dart';

class AnalyticsSection extends StatelessWidget {
  final bool stackCharts;

  const AnalyticsSection({super.key, required this.stackCharts});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: stackCharts ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: stackCharts ? 0 : 1,
          child: const ChartWrapper(
            title: "Total Revenue",
            chart: RevenueLineChart(),
          ),
        ),
        // Используем твой хелпер отступа
        _buildSpacing(),
        Expanded(
          flex: stackCharts ? 0 : 1,
          child: const ChartWrapper(
            title: "Active Subscriptions",
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
