import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/widgets/stat_card.dart';
import 'package:erpmax_client/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;

  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isMobile = screenWidth < AppDesign.mobileBreakpoint;
    final bool isTablet =
        screenWidth < AppDesign.desktopBreakpoint && !isMobile;
    final bool stackCharts = screenWidth < 1100;

    final dataSource = DashboardLocalDataSourceImpl(colors: theme);
    final summaryData = dataSource.getSummaryData();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.pagePadding,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "Overview"),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: summaryData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 2.2 : (isTablet ? 1.8 : 1.6),
            ),
            itemBuilder: (context, index) {
              final data = summaryData[index];
              return StatCard(
                title: data.title,
                value: "${data.currency}${data.value.toStringAsFixed(0)}",
                trend:
                    "${data.changePercentage > 0 ? '+' : ''}${data.changePercentage}%",
                isPositive: data.changePercentage > 0,
                icon: data.icon,
                color: CardColorHelper.getCardColor(theme, index),
              );
            },
          ),
          const SizedBox(height: 32),
          SectionHeader(title: "Analytics"),
          const SizedBox(height: 20),
          Flex(
            direction: stackCharts ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: ChartWrapper(
                  title: "Total Revenue",
                  subtitle: null,
                  chart: const RevenueLineChart(),
                ),
              ),
              ChartSpacing(isVertical: stackCharts),
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: ChartWrapper(
                  title: "Active Subscriptions",
                  subtitle: null,
                  chart: const SubscriptionsBarChart(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h2.copyWith(
        color: context.theme.appColor.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ChartSpacing extends StatelessWidget {
  final bool isVertical;

  const ChartSpacing({super.key, required this.isVertical});

  @override
  Widget build(BuildContext context) {
    return isVertical ? const SizedBox(height: 24) : const SizedBox(width: 24);
  }
}

class CardColorHelper {
  static Color getCardColor(AppColorExtension colors, int index) {
    final List<Color> palette = [
      colors.primary,
      colors.success,
      colors.warning,
      colors.infoText,
    ];
    return palette[index % palette.length];
  }
}

class ChartWrapper extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget chart;

  const ChartWrapper({
    super.key,
    required this.title,
    this.subtitle,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.gray100),
        boxShadow: [
          BoxShadow(
            color: theme.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartHeader(title: title, subtitle: subtitle),
          const SizedBox(height: 32),
          SizedBox(height: 320, child: chart),
        ],
      ),
    );
  }
}

class ChartHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const ChartHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h3),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
                ),
              ],
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.more_horiz, color: theme.gray400),
            ),
          ),
        ),
      ],
    );
  }
}

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
              reservedSize: 30,
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

                return Text(text, style: style);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20000,
              reservedSize: 60,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${(value ~/ 1000)}000',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.gray400,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.left,
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

class SubscriptionsBarChart extends StatelessWidget {
  const SubscriptionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 300,
        barTouchData: BarTouchData(enabled: false),
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

                return Text(text, style: style);
              },
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 75,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toInt().toString(),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.gray400,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 75,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: theme.borderLight, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 85,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 125,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 160,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 195,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 235,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 265,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                toY: 290,
                color: theme.textPrimary,
                width: 40,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
