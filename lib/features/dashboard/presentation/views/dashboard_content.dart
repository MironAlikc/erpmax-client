import 'package:erpmax_client/features/saas_admin/presentation/widgets/saas/subscriptions_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/common/app_stat_card.dart';
import '../widgets/saas/revenue_line_chart.dart';

class DashboardContent extends StatelessWidget {
  final double screenWidth;

  const DashboardContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final bool isSmall = screenWidth < 1100;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          // Сетка карточек статистики
          GridView.count(
            crossAxisCount: screenWidth < 600
                ? 1
                : (screenWidth < 1200 ? 2 : 4),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.8,
            children: [
              AppStatCard(
                title: "MRR",
                value: "SAR 125,000",
                trend: "+12.5%",
                isPositive: true,
                icon: Icons.attach_money,
              ),
              AppStatCard(
                title: "Churn Rate",
                value: "2.4%",
                trend: "-0.5%",
                isPositive: false,
                icon: Icons.trending_down,
              ),
              AppStatCard(
                title: "Customer Retention",
                value: "98.2%",
                trend: "+1.1%",
                isPositive: true,
                icon: Icons.people_outline,
              ),
              AppStatCard(
                title: "System Performance",
                value: "99.99%",
                trend: "0%",
                isPositive: null,
                icon: Icons.show_chart,
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Блок графиков
          Flex(
            direction: isSmall ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isSmall ? 0 : 1,
                child: _ChartWrapper(
                  title: "Total Revenue",
                  chart: const RevenueLineChart(),
                ),
              ),
              if (!isSmall) const SizedBox(width: 24),
              if (isSmall) const SizedBox(height: 24),
              Expanded(
                flex: isSmall ? 0 : 1,
                child: _ChartWrapper(
                  title: "Active Subscriptions",
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

class _ChartWrapper extends StatelessWidget {
  final String title;
  final Widget chart;

  const _ChartWrapper({required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E293B).withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(height: 320, child: chart),
        ],
      ),
    );
  }
}
