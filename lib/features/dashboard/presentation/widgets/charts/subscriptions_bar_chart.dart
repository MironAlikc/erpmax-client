import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SubscriptionsBarChart extends StatelessWidget {
  const SubscriptionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        maxY: 300,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => theme.white,
            tooltipBorderRadius: BorderRadius.circular(8),
            tooltipPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            tooltipBorder: BorderSide(color: theme.gray200, width: 1),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.round().toString(),
                const TextStyle(
                  color: Color(0xFF0F172A),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) =>
                  _buildMonthTitles(context, value, meta),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 45,
              interval: 75,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  space: 8,
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: theme.gray400,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 75,
          getDrawingHorizontalLine: (value) => FlLine(
            color: const Color(0xFFE2E8F0),
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: _getBarGroups(theme),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups(AppColorExtension theme) {
    final List<double> values = [100, 120, 150, 180, 220, 255, 300];
    const Color barColor = Color(0xFF0F172A);

    return List.generate(values.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: values[index],
            color: barColor,
            width: 42,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildMonthTitles(BuildContext context, double value, TitleMeta meta) {
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
    ];
    if (value.toInt() < 0 || value.toInt() >= months.length) {
      return const SizedBox();
    }
    return SideTitleWidget(
      meta: meta,
      space: 12,
      child: Text(
        months[value.toInt()],
        style: TextStyle(
          color: context.theme.appColor.gray400,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
