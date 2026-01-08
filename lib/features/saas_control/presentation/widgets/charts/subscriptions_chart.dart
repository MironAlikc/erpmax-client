import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class SubscriptionsChart extends StatelessWidget {
  const SubscriptionsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final Color barColor = const Color(0xFF0F172A);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 300,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 150,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                meta: meta,
                child: Text(
                  value.toInt().toString(),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.gray400,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                ];
                if (value >= 0 && value < months.length) {
                  return SideTitleWidget(
                    meta: meta,
                    space: 12,
                    child: Text(
                      months[value.toInt()],
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
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 150,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: theme.gray100, strokeWidth: 1, dashArray: [5, 5]),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          _buildGroup(0, 100, barColor),
          _buildGroup(1, 120, barColor),
          _buildGroup(2, 150, barColor),
          _buildGroup(3, 185, barColor),
          _buildGroup(4, 225, barColor),
          _buildGroup(5, 255, barColor),
          _buildGroup(6, 300, barColor),
        ],
      ),
    );
  }

  BarChartGroupData _buildGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 16, // Узкие столбцы как в дизайне
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }
}
