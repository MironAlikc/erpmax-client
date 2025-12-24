import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class VisitorLogsContent extends StatelessWidget {
  const VisitorLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: AppAppStatCard(
                  title: "Total Visitors",
                  value: "1,245",
                  subtitle: "+12% from last week",
                  color: theme.primary,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: AppAppStatCard(
                  title: "Active Now",
                  value: "42",
                  subtitle: "Real-time users",
                  color: theme.success,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: AppAppStatCard(
                  title: "Blocked IPs",
                  value: "15",
                  subtitle: "Threats prevented",
                  color: theme.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildVisitorTable(theme),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildVisitorTable(AppColorExtension theme) {
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
            padding: EdgeInsets.all(24),
            child: Text(
              "Visitor Logs",
              style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
            ),
          ),
          ErpMaxDataTable<VisitorRecord>(
            items: _mockVisitors,
            columns: [
              ErpMaxColumn(title: "IP Address", weight: 0.25),
              ErpMaxColumn(title: "Country", weight: 0.2),
              ErpMaxColumn(title: "Visits", weight: 0.1),
              ErpMaxColumn(title: "Last Visit", weight: 0.2),
              ErpMaxColumn(title: "Status", weight: 0.15),
              ErpMaxColumn(
                title: "Actions",
                weight: 0.1,
                textAlign: TextAlign.right,
              ),
            ],
            rowBuilder: (item) => [
              Text(
                item.ipAddress,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(Icons.public, size: 16, color: theme.textDisabled),
                  const SizedBox(width: 8),
                  Text(item.country),
                ],
              ),
              Text(item.visits.toString()),
              Text(
                item.lastVisit,
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              item.isActive
                  ? AppStatusChip.success("Active")
                  : AppStatusChip.warning("Blocked"),
              Icon(Icons.more_horiz, color: theme.textDisabled),
            ],
          ),
        ],
      ),
    );
  }
}

class VisitorRecord {
  final String ipAddress;
  final String country;
  final int visits;
  final String lastVisit;
  final bool isActive;
  const VisitorRecord({
    required this.ipAddress,
    required this.country,
    required this.visits,
    required this.lastVisit,
    required this.isActive,
  });
}

final List<VisitorRecord> _mockVisitors = [
  const VisitorRecord(
    ipAddress: "192.168.1.101",
    country: "Saudi Arabia",
    visits: 15,
    lastVisit: "2024-03-15 14:30",
    isActive: true,
  ),
  const VisitorRecord(
    ipAddress: "10.0.0.55",
    country: "UAE",
    visits: 8,
    lastVisit: "2024-03-15 14:25",
    isActive: true,
  ),
  const VisitorRecord(
    ipAddress: "172.16.0.23",
    country: "Egypt",
    visits: 3,
    lastVisit: "2024-03-15 14:10",
    isActive: false,
  ),
  const VisitorRecord(
    ipAddress: "192.168.1.105",
    country: "Saudi Arabia",
    visits: 42,
    lastVisit: "2024-03-15 14:05",
    isActive: true,
  ),
  const VisitorRecord(
    ipAddress: "203.0.113.1",
    country: "USA",
    visits: 1,
    lastVisit: "2024-03-15 13:55",
    isActive: true,
  ),
];
