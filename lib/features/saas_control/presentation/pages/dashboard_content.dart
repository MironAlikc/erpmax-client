import 'package:erpmax_client/core/utils/card_color_helper.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/stat_card.dart';
import 'package:erpmax_client/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/subscriptions_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import '../widgets/components/section_header.dart';
import '../widgets/components/chart_wrapper.dart';
import '../widgets/charts/revenue_line_chart.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;
  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    // 1. Адаптивная логика
    final bool isMobile = screenWidth < AppDesign.mobileBreakpoint;
    final bool isTablet =
        screenWidth < AppDesign.desktopBreakpoint && !isMobile;
    final bool stackCharts = screenWidth < 1100;

    // 2. Получение данных
    final summaryData = DashboardLocalDataSourceImpl(
      colors: theme,
    ).getSummaryData();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.pagePadding,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "Overview"),
          const SizedBox(height: 20),

          // Сетка карточек
          _buildSummaryGrid(summaryData, isMobile, isTablet, theme),

          const SizedBox(height: 32),
          const SectionHeader(title: "Analytics"),
          const SizedBox(height: 20),

          // Графики
          Flex(
            direction: stackCharts ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: const ChartWrapper(
                  title: "Total Revenue",
                  chart: RevenueLineChart(),
                ),
              ),
              _buildSpacing(stackCharts),
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: const ChartWrapper(
                  title: "Active Subscriptions",
                  chart: SubscriptionsBarChart(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSummaryGrid(data, isMobile, isTablet, theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isMobile ? 2.2 : 1.6,
      ),
      itemBuilder: (context, index) {
        final item = data[index];
        return StatCard(
          title: item.title,
          value: "${item.currency}${item.value.toStringAsFixed(0)}",
          trend:
              "${item.changePercentage > 0 ? '+' : ''}${item.changePercentage}%",
          isPositive: item.changePercentage > 0,
          icon: item.icon,
          color: CardColorHelper.getCardColor(theme, index),
        );
      },
    );
  }

  Widget _buildSpacing(bool isVertical) =>
      isVertical ? const SizedBox(height: 24) : const SizedBox(width: 24);
}
