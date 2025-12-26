import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) =>
                  _buildMonthTitles(context, value),
              reservedSize: 30,
            ),
          ),
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

  List<BarChartGroupData> _getBarGroups(AppColorExtension theme) {
    final List<double> values = [85, 125, 160, 195, 235, 265, 290];

    return List.generate(values.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: values[index],
            color: theme.textPrimary,
            width: 22,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 300,
              color: theme.gray100.withValues(alpha: 0.5),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildMonthTitles(BuildContext context, double value) {
    int monthIndex = value.toInt() + 1;

    if (monthIndex < 1 || monthIndex > 12) {
      return const SizedBox();
    }

    final String locale = Localizations.localeOf(context).languageCode;

    final String monthName = DateFormat.MMM(
      locale,
    ).format(DateTime(2025, monthIndex));

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        monthName,
        style: AppTextStyles.bodySmall.copyWith(
          color: context.theme.appColor.gray400,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
