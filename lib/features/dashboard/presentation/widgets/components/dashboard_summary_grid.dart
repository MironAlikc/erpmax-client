import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/utils/card_color_helper.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/stat_card.dart';
import 'package:erpmax_client/features/dashboard/data/datasources/dashboard_local_datasource.dart';

class DashboardSummaryGrid extends StatelessWidget {
  final double screenWidth;

  const DashboardSummaryGrid({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    // Адаптивная логика колонок
    final bool isMobile = screenWidth < AppDesign.mobileBreakpoint;
    final bool isTablet =
        screenWidth < AppDesign.desktopBreakpoint && !isMobile;

    final dataSource = DashboardLocalDataSourceImpl(colors: theme);
    final summaryData = dataSource.getSummaryData();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: summaryData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isMobile ? 2.2 : 1.6,
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
    );
  }
}
