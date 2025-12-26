import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class SubscriptionsBarChart extends StatelessWidget {
  const SubscriptionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 300,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => theme.white,
            tooltipBorder: BorderSide(color: theme.gray100),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.round().toString(),
                AppTextStyles.bodySmallBold.copyWith(color: theme.textPrimary),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          // Скрываем верхние и правые подписи
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          // Настройка месяцев снизу
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => _buildMonthTitles(value, theme),
              reservedSize: 30,
            ),
          ),
          // Настройка шкалы слева
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 75,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.gray400,
                    fontSize: 12,
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
          getDrawingHorizontalLine: (value) =>
              FlLine(color: theme.borderLight, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        barGroups: _getBarGroups(theme),
      ),
    );
  }

  // Данные для столбцов
  List<BarChartGroupData> _getBarGroups(theme) {
    final List<double> values = [85, 125, 160, 195, 235, 265, 290];

    return List.generate(values.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: values[index],
            color: theme.textPrimary, // Темный цвет столбцов для контраста
            width: 22,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 300,
              color: theme.gray100.withOpacity(0.5),
            ),
          ),
        ],
      );
    });
  }

  // Подписи месяцев
  Widget _buildMonthTitles(double value, theme) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
    if (value.toInt() < 0 || value.toInt() >= months.length)
      return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        months[value.toInt()],
        style: AppTextStyles.bodySmall.copyWith(
          color: theme.gray400,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
