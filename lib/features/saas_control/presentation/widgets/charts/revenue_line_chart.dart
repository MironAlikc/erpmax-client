import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

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
          horizontalInterval: 20000,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: theme.borderLight, strokeWidth: 1);
          },
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
              reservedSize: 32,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                final style = AppTextStyles.bodySmall.copyWith(
                  color: theme.gray400,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                );

                String text;
                switch (value.toInt()) {
                  case 0:
                    text = 'Jan';
                    break;
                  case 1:
                    text = 'Feb';
                    break;
                  case 2:
                    text = 'Mar';
                    break;
                  case 3:
                    text = 'Apr';
                    break;
                  case 4:
                    text = 'May';
                    break;
                  case 5:
                    text = 'Jun';
                    break;
                  case 6:
                    text = 'Jul';
                    break;
                  default:
                    return const SizedBox();
                }

                // Исправлено: передаем meta целиком
                return SideTitleWidget(
                  meta: meta,
                  space: 10,
                  child: Text(text, style: style),
                );
              },
            ),
          ),
          // Левая ось (Значения)
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20000,
              reservedSize: 45,
              getTitlesWidget: (double value, TitleMeta meta) {
                final style = AppTextStyles.bodySmall.copyWith(
                  color: theme.gray400,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                );

                // Исправлено: используем SideTitleWidget для выравнивания цифр
                return SideTitleWidget(
                  meta: meta,
                  space: 8,
                  child: Text(
                    '${(value ~/ 1000)}k',
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 80000,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 40000),
              FlSpot(1, 28000),
              FlSpot(2, 35000),
              FlSpot(3, 48000),
              FlSpot(4, 55000),
              FlSpot(5, 58000),
              FlSpot(6, 70000),
            ],
            isCurved: true,
            color: const Color(0xFF34D399),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.activeGreen.withValues(alpha: 0.5),
                  theme.activeGreen.withValues(alpha: 0.3),
                  theme.activeGreen.withValues(alpha: 0.1),
                  theme.activeGreen.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
