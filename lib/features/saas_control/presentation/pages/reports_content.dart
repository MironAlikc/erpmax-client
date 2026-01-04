import 'package:erpmax_client/core/theme/app_dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_base_stat_card.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/core/widgets/shared/app_placeholder.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/panels/subscriber_detail_panel.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StatData {
  final String title;
  final String value;
  final IconData icon;
  final String trend;
  final bool isPositive;
  const StatData({
    required this.title,
    required this.value,
    required this.icon,
    required this.trend,
    required this.isPositive,
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

class UsageModuleData {
  final String moduleName;
  final int activeSubscriptions;
  final int usersCount;
  final String storageLimit;
  const UsageModuleData({
    required this.moduleName,
    required this.activeSubscriptions,
    required this.usersCount,
    required this.storageLimit,
  });
}

class PerformanceData {
  final String date;
  final String uptime;
  final String responseTime;
  final String errorRate;
  const PerformanceData({
    required this.date,
    required this.uptime,
    required this.responseTime,
    required this.errorRate,
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
    const ErpMaxTabItem(name: 'Subscriptions Report', icon: LucideIcons.users),
    const ErpMaxTabItem(name: 'Revenue Report', icon: LucideIcons.wallet),
    const ErpMaxTabItem(name: 'Customers Report', icon: LucideIcons.search),
    const ErpMaxTabItem(name: 'Usage Report', icon: LucideIcons.barChart3),
    const ErpMaxTabItem(name: 'Performance Report', icon: LucideIcons.gauge),
  ];

  final List<PerformanceData> _performanceMockData = [
    const PerformanceData(
      date: "2024-05-21",
      uptime: "99.9%",
      responseTime: "120ms",
      errorRate: "0.01%",
    ),
    const PerformanceData(
      date: "2024-05-22",
      uptime: "99.9%",
      responseTime: "120ms",
      errorRate: "0.01%",
    ),
    const PerformanceData(
      date: "2024-05-23",
      uptime: "99.9%",
      responseTime: "120ms",
      errorRate: "0.01%",
    ),
  ];

  final List<UsageModuleData> _usageMockData = [
    const UsageModuleData(
      moduleName: "Accounting",
      activeSubscriptions: 150,
      usersCount: 450,
      storageLimit: "500 GB",
    ),
    const UsageModuleData(
      moduleName: "Inventory",
      activeSubscriptions: 120,
      usersCount: 300,
      storageLimit: "300 GB",
    ),
    const UsageModuleData(
      moduleName: "Sales",
      activeSubscriptions: 180,
      usersCount: 600,
      storageLimit: "200 GB",
    ),
  ];

  final List<ReportSubscriber> _newSubscribers = [
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

  final List<ReportSubscriber> _expiringSubscribers = [
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(AppDimens.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppDimens.elementGap),
          ErpMaxTabFilter(
            items: _reportTabs,
            selectedItem: _selectedReportType,
            onSelected: (name) => setState(() => _selectedReportType = name),
          ),
          const SizedBox(height: AppDimens.sectionGap),
          _buildActiveReportContent(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildActiveReportContent() {
    switch (_selectedReportType) {
      case 'Subscriptions Report':
        return _buildSubscriptionsReport();
      case 'Revenue Report':
        return _buildRevenueReport();
      case 'Customers Report':
        return _buildCustomersTableSection();
      case 'Usage Report':
        return _buildUsageTableSection();
      case 'Performance Report':
        return _buildPerformanceTableSection();
      default:
        return AppPlaceholder(
          title: "Data for $_selectedReportType",
          subtitle: "Analytical engine is calculating current metrics.",
          icon: LucideIcons.loader,
        );
    }
  }

  Widget _buildSubscriptionsReport() {
    return Column(
      children: [
        _buildStatsGrid([
          const StatData(
            title: "Active Subscriptions",
            value: "1,234",
            icon: LucideIcons.users,
            trend: "+12.5%",
            isPositive: true,
          ),
          const StatData(
            title: "New Subscribers",
            value: "56",
            icon: LucideIcons.userPlus,
            trend: "+8.2%",
            isPositive: true,
          ),
          const StatData(
            title: "Expiring Soon",
            value: "23",
            icon: LucideIcons.clock,
            trend: "-2.4%",
            isPositive: false,
          ),
        ]),
        const SizedBox(height: AppDimens.sectionGap),
        _buildReportTableSection("New Subscribers", _newSubscribers),
        const SizedBox(height: AppDimens.sectionGap),
        _buildReportTableSection("Expiring Soon", _expiringSubscribers),
      ],
    );
  }

  Widget _buildRevenueReport() {
    return Column(
      children: [
        _buildStatsGrid([
          const StatData(
            title: "Total Revenue",
            value: "SAR 500,000",
            icon: LucideIcons.creditCard,
            trend: "+15%",
            isPositive: true,
          ),
          const StatData(
            title: "MRR",
            value: "SAR 45,000",
            icon: LucideIcons.trendingUp,
            trend: "+8%",
            isPositive: true,
          ),
          const StatData(
            title: "ARPU",
            value: "SAR 400",
            icon: LucideIcons.activity,
            trend: "+2%",
            isPositive: true,
          ),
        ]),
        const SizedBox(height: AppDimens.sectionGap),
        _buildRevenueTableContent(),
      ],
    );
  }

  // --- ТАБЛИЦА: Performance Report ---

  Widget _buildPerformanceTableSection() {
    final theme = context.theme.appColor;
    final List<ErpMaxColumn> cols = [
      ErpMaxColumn(title: "Date", weight: 0.25),
      ErpMaxColumn(title: "Uptime", weight: 0.25, textAlign: TextAlign.center),
      ErpMaxColumn(
        title: "Response Time",
        weight: 0.25,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(
        title: "Error Rate",
        weight: 0.25,
        textAlign: TextAlign.right,
      ),
    ];

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader("Performance Report"),
          ErpMaxTable(
            minWidth: 800,
            columns: cols,
            rows: _performanceMockData
                .map(
                  (data) => ErpMaxRow(
                    columns: cols,
                    cells: [
                      Text(
                        data.date,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        data.uptime,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                      Text(
                        data.responseTime,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        data.errorRate,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // --- ТАБЛИЦА: Usage Report ---

  Widget _buildUsageTableSection() {
    final theme = context.theme.appColor;
    final List<ErpMaxColumn> cols = [
      ErpMaxColumn(title: "Module Name", weight: 0.3),
      ErpMaxColumn(
        title: "Active Subscriptions",
        weight: 0.25,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(
        title: "Users Count",
        weight: 0.2,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(
        title: "Storage Limit",
        weight: 0.25,
        textAlign: TextAlign.right,
      ),
    ];

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader("Usage Report"),
          ErpMaxTable(
            minWidth: 900,
            columns: cols,
            rows: _usageMockData
                .map(
                  (data) => ErpMaxRow(
                    columns: cols,
                    cells: [
                      Text(
                        data.moduleName,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                      Text(
                        "${data.activeSubscriptions}",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        "${data.usersCount}",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        data.storageLimit,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // --- ТАБЛИЦА: Customers Report ---

  Widget _buildCustomersTableSection() {
    final theme = context.theme.appColor;
    final cols = [
      ErpMaxColumn(title: "Company Name", weight: 0.25),
      ErpMaxColumn(title: "Contact Person", weight: 0.25),
      ErpMaxColumn(title: "Email", weight: 0.25),
      ErpMaxColumn(
        title: "Join Date",
        weight: 0.25,
        textAlign: TextAlign.right,
      ),
    ];
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader("Customers Report"),
          ErpMaxTable(
            minWidth: 1000,
            columns: cols,
            rows: List.generate(
              3,
              (i) => ErpMaxRow(
                columns: cols,
                cells: [
                  Text(
                    "Company ${i + 1}",
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Text(
                    "Manager ${i + 1}",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(
                    "contact${i + 1}@company.com",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(
                    "2024-01-15",
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- ВСПОМОГАТЕЛЬНЫЕ КОМПОНЕНТЫ (Stats, Headers, Common Tables) ---

  Widget _buildStatsGrid(List<StatData> stats) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int count = constraints.maxWidth > 1200
            ? 3
            : (constraints.maxWidth > 768 ? 2 : 1);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: 160,
          ),
          itemBuilder: (context, index) {
            final item = stats[index];
            return AppBaseStatCard(
              title: item.title,
              value: item.value,
              icon: item.icon,
              trailing: StatTrendBadge(
                trend: item.trend,
                isPositive: item.isPositive,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTableHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        title,
        style: AppTextStyles.h3.copyWith(
          color: context.theme.appColor.textPrimary,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildRevenueTableContent() {
    final theme = context.theme.appColor;
    final cols = [
      ErpMaxColumn(title: "Date", weight: 0.15),
      ErpMaxColumn(title: "Company Name", weight: 0.25),
      ErpMaxColumn(title: "Plan Name", weight: 0.20),
      ErpMaxColumn(title: "Amount", weight: 0.20),
      ErpMaxColumn(title: "Payment Method", weight: 0.20),
    ];
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader("Revenue Report"),
          ErpMaxTable(
            minWidth: 1000,
            columns: cols,
            rows: List.generate(
              5,
              (i) => ErpMaxRow(
                columns: cols,
                cells: [
                  Text(
                    "2024-05-${11 + i}",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(
                    "Company ${i + 1}",
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Text(
                    "Enterprise",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(
                    "SAR 10,000",
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Text(
                    "Credit Card",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTableSection(String title, List<ReportSubscriber> data) {
    final theme = context.theme.appColor;
    final cols = [
      ErpMaxColumn(title: "Company Name", weight: 0.22),
      ErpMaxColumn(title: "Plan Name", weight: 0.18),
      ErpMaxColumn(title: "Status", weight: 0.12, textAlign: TextAlign.center),
      ErpMaxColumn(
        title: "Start Date",
        weight: 0.14,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(
        title: "End Date",
        weight: 0.14,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(title: "Price", weight: 0.12, textAlign: TextAlign.right),
      ErpMaxColumn(title: "Actions", weight: 0.08, textAlign: TextAlign.right),
    ];
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader(title),
          ErpMaxTable(
            minWidth: 1100,
            columns: cols,
            rows: data
                .map(
                  (item) => ErpMaxRow(
                    onTap: () => _openDetailPanel(item),
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
                      Center(child: AppStatusMapper(status: item.status)),
                      Text(
                        item.startDate,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        item.endDate,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                      Text(
                        item.price,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.moreHorizontal,
                          color: Color(0xFF667085),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _openDetailPanel(ReportSubscriber subscriber) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            elevation: 16,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: double.infinity,
              color: Colors.white,
              child: SubscriberDetailPanel(
                subscriber: subscriber,
                onClose: () => Navigator.of(ctx).pop(),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutQuart)),
          child: child,
        );
      },
    );
  }
}
