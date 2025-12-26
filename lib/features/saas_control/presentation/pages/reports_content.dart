import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/core/widgets/shared/app_placeholder.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/features/saas_control/data/models/report_models.dart';
import 'package:erpmax_client/features/saas_control/data/report_mock_data.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/panels/subscriber_detail_panel.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
import '../widgets/report_widgets.dart';

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

  void _openDetailPanel(ReportSubscriber subscriber) {
    showGeneralDialog(
      context: AppRouter.rootNavigatorKey.currentContext ?? context,
      useRootNavigator: false,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (dialogContext, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => Navigator.of(dialogContext).pop(),
                  child: Container(color: Colors.transparent),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SubscriberDetailPanel(
                  subscriber: subscriber,
                  onClose: () => Navigator.of(dialogContext).pop(),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDesign.elementGap),
          ErpMaxTabFilter(
            items: _reportTabs,
            selectedItem: _selectedReportType,
            onSelected: (name) => setState(() => _selectedReportType = name),
          ),
          const SizedBox(height: AppDesign.sectionGap),
          if (_selectedReportType == 'Subscriptions Report') ...[
            _buildStatsGrid(),
            const SizedBox(height: AppDesign.sectionGap),
            _buildReportTableSection("New Subscribers", newSubscribersData),
            const SizedBox(height: AppDesign.sectionGap),
            _buildReportTableSection("Expiring Soon", expiringSoonData),
          ] else ...[
            AppPlaceholder(
              title: "Data for $_selectedReportType",
              subtitle:
                  "This report is currently being processed by the system analytics engine.",
              icon: Icons.analytics_outlined,
            ),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < AppBreakpoints.tablet;

        final stats = [
          const ReportStat(
            title: "Active Subscriptions",
            value: "1,234",
            trend: "+12.5%",
            isUp: true,
            icon: Icons.group_outlined,
          ),
          const ReportStat(
            title: "New Subscribers",
            value: "56",
            trend: "+8.2%",
            isUp: true,
            icon: Icons.add_chart_outlined,
          ),
          const ReportStat(
            title: "Expiring Soon",
            value: "23",
            trend: "-2.4%",
            isUp: false,
            icon: Icons.timer_outlined,
          ),
        ];

        return Wrap(
          spacing: AppDesign.elementGap,
          runSpacing: AppDesign.elementGap,
          children: stats
              .map(
                (stat) => ReportStatCard(
                  stat: stat,
                  width: isNarrow
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (AppDesign.elementGap * 2)) / 3,
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
      ErpMaxColumn(title: "Status", weight: 0.12),
      ErpMaxColumn(title: "Start Date", weight: 0.15),
      ErpMaxColumn(title: "End Date", weight: 0.15),
      ErpMaxColumn(title: "Price", weight: 0.13),
      ErpMaxColumn(title: "", weight: 0.05, textAlign: TextAlign.right),
    ];

    return AppCard(
      padding: EdgeInsets.zero,
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
                      AppStatusMapper(status: item.status),
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
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFFD0D5DD),
                        size: 20,
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
}
