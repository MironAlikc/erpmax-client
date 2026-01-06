import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/charts/revenue_growth_chart.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/charts/subscriptions_chart.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/quick_actions_card.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/recent_subscribers_table.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/saas_metrics_grid.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/saas_summary_ribbon.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/dashboard/system_health_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;
  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    int kpiColumns = screenWidth < 800 ? 1 : (screenWidth < 1400 ? 2 : 4);
    final bool isDesktop = screenWidth > 1200;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SaasSummaryRibbon(),
          const SizedBox(height: 32.0),
          SaasMetricsGrid(columns: kpiColumns),
          const SizedBox(height: 32.0),
          DashboardChartsSection(isStacked: !isDesktop),
          const SizedBox(height: 32.0),
          _buildInfoCardsSection(isDesktop),
          const SizedBox(height: 32.0),

          _buildBottomGrid(isDesktop),

          const SizedBox(height: 32.0),
        ],
      ),
    );
  }

  Widget _buildBottomGrid(bool isDesktop) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 7, child: RecentSubscribersSection()),
          const SizedBox(width: 24.0),
          const Expanded(
            flex: 3,
            child: Column(
              children: [
                SystemHealthCard(),
                SizedBox(height: 24.0),
                QuickActionsCard(),
              ],
            ),
          ),
        ],
      );
    } else {
      return const Column(
        children: [
          RecentSubscribersSection(),
          SizedBox(height: 24.0),
          SystemHealthCard(),
          SizedBox(height: 24.0),
          QuickActionsCard(),
        ],
      );
    }
  }

  Widget _buildInfoCardsSection(bool isDesktop) {
    final List<Widget> cards = [
      const Expanded(child: DashboardSystemAlerts()),
      const SizedBox(width: 24.0, height: 24.0),
      const Expanded(child: DashboardPendingTasks()),
    ];

    if (isDesktop) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards,
        ),
      );
    } else {
      return Column(
        children: cards.map((e) => e is Expanded ? e.child : e).toList(),
      );
    }
  }
}

class DashboardChartsSection extends StatelessWidget {
  final bool isStacked;
  const DashboardChartsSection({super.key, required this.isStacked});

  @override
  Widget build(BuildContext context) {
    final charts = [
      const ChartWrapper(title: "Revenue Growth", chart: RevenueGrowthChart()),
      const ChartWrapper(title: "Subscriptions", chart: SubscriptionsChart()),
    ];

    return isStacked
        ? Column(children: [charts[0], const SizedBox(height: 24.0), charts[1]])
        : Row(
            children: [
              Expanded(child: charts[0]),
              const SizedBox(width: 24.0),
              Expanded(child: charts[1]),
            ],
          );
  }
}

class ChartWrapper extends StatelessWidget {
  final String title;
  final Widget chart;
  const ChartWrapper({super.key, required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.gray100, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray900,
                  fontSize: 14,
                ),
              ),
              Icon(
                title.contains("Revenue")
                    ? Icons.stacked_line_chart
                    : Icons.pie_chart_outline,
                size: 18,
                color: const Color(0xFF14B8A6),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          SizedBox(height: 180, child: chart),
        ],
      ),
    );
  }
}

class DashboardSystemAlerts extends StatelessWidget {
  const DashboardSystemAlerts({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "System Alerts",
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray900,
                  fontSize: 14,
                ),
              ),
              Icon(LucideIcons.alertTriangle, color: theme.warning, size: 18),
            ],
          ),
          const SizedBox(height: 20),
          _buildItem(
            theme,
            "High memory usage on main server",
            "5m",
            const Color(0xFFFFFBEB),
          ),
          const SizedBox(height: 12),
          _buildItem(
            theme,
            "System update available",
            "1h",
            const Color(0xFFEFF6FF),
          ),
          const SizedBox(height: 12),
          _buildItem(theme, "Backup failed", "2h", const Color(0xFFFEF2F2)),
        ],
      ),
    );
  }

  Widget _buildItem(
    AppColorExtension theme,
    String label,
    String time,
    Color bgColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(color: theme.gray700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.gray400,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPendingTasks extends StatelessWidget {
  const DashboardPendingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pending Tasks",
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray900,
                  fontSize: 14,
                ),
              ),
              Icon(LucideIcons.clock, color: theme.gray400, size: 18),
            ],
          ),
          const SizedBox(height: 20),
          _item(theme, "Subscriptions pending renewal", 12),
          const SizedBox(height: 12),
          _item(theme, "Unpaid invoices", 8),
          const SizedBox(height: 12),
          _item(theme, "Open support tickets", 5),
        ],
      ),
    );
  }

  Widget _item(AppColorExtension theme, String title, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.gray50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.gray100.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(color: theme.gray700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: theme.white,
              border: Border.all(color: theme.gray200),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$count',
              style: AppTextStyles.bodySmallBold.copyWith(
                color: theme.gray900,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
