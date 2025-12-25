import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueLineChart extends StatelessWidget {
  const RevenueLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: theme.gray200, strokeWidth: 1),
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
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '${(value / 1000).toInt()}k',
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textSecondary,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < 12) {
                  final date = DateTime(2024, index + 1);

                  // 'Jan', 'Янв', 'يناير'
                  final monthName = DateFormat.MMM(
                    Localizations.localeOf(context).languageCode,
                  ).format(date);

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      monthName,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: theme.textSecondary,
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
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 40000),
              FlSpot(1, 30000),
              FlSpot(2, 45000),
              FlSpot(3, 50000),
              FlSpot(4, 58000),
              FlSpot(5, 52000),
              FlSpot(6, 75000),
            ],
            isCurved: true,
            color: theme.primary,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.primary.withValues(alpha: 0.2),
                  theme.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
