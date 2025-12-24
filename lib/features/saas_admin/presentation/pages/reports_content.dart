import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class ReportStat {
  final String title;
  final String value;
  final String trend;
  final bool isUp;
  final IconData icon;

  const ReportStat({
    required this.title,
    required this.value,
    required this.trend,
    required this.isUp,
    required this.icon,
  });
}

class ReportSubscriber {
  final String company;
  final String plan;
  final String status;
  final String startDate;
  final String endDate;
  final String price;

  const ReportSubscriber({
    required this.company,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}

class ReportsContent extends StatefulWidget {
  const ReportsContent({super.key});

  @override
  State<ReportsContent> createState() => _ReportsContentState();
}

class _ReportsContentState extends State<ReportsContent> {
  String _selectedReportType = 'Subscriptions Report';

  final List<ErpMaxTabItem> _reportTabs = [
    const ErpMaxTabItem(
      name: 'Subscriptions Report',
      icon: Icons.people_alt_outlined,
    ),
    const ErpMaxTabItem(
      name: 'Revenue Report',
      icon: Icons.account_balance_wallet_outlined,
    ),
    const ErpMaxTabItem(
      name: 'Customers Report',
      icon: Icons.person_search_outlined,
    ),
    const ErpMaxTabItem(name: 'Usage Report', icon: Icons.analytics_outlined),
    const ErpMaxTabItem(name: 'Performance Report', icon: Icons.speed_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ErpMaxTabFilter(
            items: _reportTabs,
            selectedItem: _selectedReportType,
            onSelected: (name) => setState(() => _selectedReportType = name),
          ),
          const SizedBox(height: 32),

          if (_selectedReportType == 'Subscriptions Report') ...[
            _buildStatsGrid(),
            const SizedBox(height: 32),
            _buildReportTableSection("New Subscribers", _newSubscribersData),
            const SizedBox(height: 32),
            _buildReportTableSection("Expiring Soon", _expiringSoonData),
          ] else ...[
            _buildPlaceholderContent(_selectedReportType),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
      const ReportStat(
        title: "Active Subscriptions",
        value: "1,234",
        trend: "+12%",
        isUp: true,
        icon: Icons.group_outlined,
      ),
      const ReportStat(
        title: "New Subscribers",
        value: "56",
        trend: "+5%",
        isUp: true,
        icon: Icons.add_chart_outlined,
      ),
      const ReportStat(
        title: "Expiring Soon",
        value: "23",
        trend: "-2%",
        isUp: false,
        icon: Icons.show_chart_rounded,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < 800;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: stats
              .map(
                (stat) => _StatCard(
                  stat: stat,
                  width: isNarrow
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 32) / 3,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildReportTableSection(String title, List<ReportSubscriber> data) {
    final theme = context.theme.appColor;

    final cols = [
      ErpMaxColumn(title: "Company Name", weight: 0.25),
      ErpMaxColumn(title: "Plan Name", weight: 0.15),
      ErpMaxColumn(title: "Status", weight: 0.1),
      ErpMaxColumn(title: "Start Date", weight: 0.15),
      ErpMaxColumn(title: "End Date", weight: 0.15),
      ErpMaxColumn(title: "Price", weight: 0.1),
      ErpMaxColumn(title: "Actions", weight: 0.05, textAlign: TextAlign.right),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.inactiveBg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              style: AppTextStyles.h3.copyWith(
                color: theme.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ErpMaxTable(
            minWidth: 1000,
            columns: cols,
            rows: data
                .map(
                  (item) => ErpMaxRow(
                    columns: cols,
                    cells: [
                      Text(
                        item.company,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),

                      Text(
                        item.plan,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      _StatusBadge(status: item.status),
                      Text(
                        item.startDate,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        item.endDate,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        item.price,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: theme.textDisabled),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderContent(String name) {
    final theme = context.theme.appColor;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Icon(Icons.analytics_outlined, size: 64, color: theme.inactiveBg),
            const SizedBox(height: 16),
            Text(
              "Data for $name",
              style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
            ),
            Text(
              "This report is being processed...",
              style: AppTextStyles.bodyMedium.copyWith(
                color: theme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final ReportStat stat;
  final double width;
  const _StatCard({required this.stat, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final trendColor = stat.isUp ? theme.activeGreen : theme.error;

    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.inactiveBg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(stat.icon, color: theme.textPrimary, size: 28),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: trendColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  stat.trend,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: trendColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            stat.title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.value,
            style: AppTextStyles.h1.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: theme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final isExpired = status == "Expired";

    final bgColor = isExpired
        ? theme.error.withValues(alpha: 0.1)
        : theme.success.withValues(alpha: 0.1);
    final borderColor = isExpired
        ? theme.error.withValues(alpha: 0.2)
        : theme.success.withValues(alpha: 0.2);
    final textColor = isExpired ? theme.error : theme.success;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

final _newSubscribersData = [
  const ReportSubscriber(
    company: "StartUp Inc",
    plan: "Starter",
    status: "Active",
    startDate: "2024-05-20",
    endDate: "2025-05-20",
    price: "SAR 1,000",
  ),
  const ReportSubscriber(
    company: "New Ventures",
    plan: "Professional",
    status: "Active",
    startDate: "2024-05-18",
    endDate: "2025-05-18",
    price: "SAR 2,500",
  ),
  const ReportSubscriber(
    company: "Alpha Tech",
    plan: "Enterprise",
    status: "Active",
    startDate: "2024-05-15",
    endDate: "2025-05-15",
    price: "SAR 5,000",
  ),
];

final _expiringSoonData = [
  const ReportSubscriber(
    company: "Old Co",
    plan: "Enterprise",
    status: "Expired",
    startDate: "2023-05-01",
    endDate: "2024-05-01",
    price: "SAR 10,000",
  ),
  const ReportSubscriber(
    company: "Tech Giants",
    plan: "Professional",
    status: "Active",
    startDate: "2023-06-01",
    endDate: "2024-06-01",
    price: "SAR 2,500",
  ),
];
