import 'package:erpmax_client/features/accounting/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/mocks/dashboard_mocks.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/saas/subscriptions_bar_chart.dart';
import '../widgets/charts/revenue_line_chart.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;

  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenWidth < AppDesign.mobileBreakpoint;
    final bool isTablet =
        screenWidth < AppDesign.desktopBreakpoint && !isMobile;
    final bool stackCharts = screenWidth < 1100;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.pagePadding,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("Overview"),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: DashboardMocks.summaryData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 2.2 : (isTablet ? 1.8 : 1.6),
            ),
            itemBuilder: (context, index) {
              final data = DashboardMocks.summaryData[index];
              return StatCard(
                title: data.title,
                value: "${data.currency}${data.value.toStringAsFixed(0)}",
                trend:
                    "${data.changePercentage > 0 ? '+' : ''}${data.changePercentage}%",
                isPositive: data.changePercentage > 0,
                icon: data.icon,
                color: _getCardColor(index),
              );
            },
          ),

          const SizedBox(height: 32),
          _buildSectionHeader("Analytics"),
          const SizedBox(height: 20),
          Flex(
            direction: stackCharts ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: _ChartWrapper(
                  title: "Revenue Forecast",
                  subtitle: "Monthly revenue projection",
                  chart: const RevenueLineChart(),
                ),
              ),
              _buildSpacing(stackCharts),
              Expanded(
                flex: stackCharts ? 0 : 1,
                child: _ChartWrapper(
                  title: "Active Subscriptions",
                  subtitle: "Growth by package type",
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

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.h2.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSpacing(bool isVertical) {
    return isVertical ? const SizedBox(height: 24) : const SizedBox(width: 24);
  }

  Color _getCardColor(int index) {
    final List<Color> colors = [
      AppColors.primary,
      AppColors.success,
      const Color(0xFFF59E0B),
      const Color(0xFF8B5CF6),
    ];
    return colors[index % colors.length];
  }
}

class _ChartWrapper extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget chart;

  const _ChartWrapper({
    required this.title,
    this.subtitle,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.gray500,
                        ),
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
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.more_horiz, color: AppColors.gray400),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(height: 320, child: chart),
        ],
      ),
    );
  }
}
