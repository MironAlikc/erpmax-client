import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class RevenueGrowthChart extends StatelessWidget {
  const RevenueGrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final Color chartColor = const Color(0xFF14B8A6);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 40000,
          getDrawingHorizontalLine: (value) => FlLine(
            color: theme.gray100.withOpacity(0.5),
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 40000,
              reservedSize: 45,
              getTitlesWidget: (value, meta) {
                if (value > 80000) return const SizedBox();

                return SideTitleWidget(
                  meta: meta,
                  space: 8,
                  child: Text(
                    value.toInt().toString(),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.gray400,
                      fontSize: 11,
                    ),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 1,
              getTitlesWidget: (value, meta) {
                if (value % 1 != 0) {
                  return const SizedBox();
                }

                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                ];
                final index = value.toInt();
                if (index >= 0 && index < months.length) {
                  return SideTitleWidget(
                    meta: meta,
                    space: 12,
                    child: Text(
                      months[index],
                      style: AppTextStyles.bodySmall.copyWith(
                        color: theme.gray400,
                        fontSize: 11,
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: const LineTouchData(enabled: true),
        minX: -0.1,
        maxX: 6.1,
        minY: 0,
        maxY: 95000,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 40000),
              FlSpot(1, 32000),
              FlSpot(2, 45000),
              FlSpot(3, 52000),
              FlSpot(4, 68000),
              FlSpot(5, 62000),
              FlSpot(6, 82000),
            ],
            isCurved: true,
            curveSmoothness: 0.4,
            color: chartColor,
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  chartColor.withOpacity(0.15),
                  chartColor.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
