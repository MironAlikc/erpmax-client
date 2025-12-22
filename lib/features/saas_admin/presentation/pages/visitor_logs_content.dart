import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';

class VisitorLogsContent extends StatelessWidget {
  const VisitorLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          const Row(
            children: [
              Expanded(
                child: AppAppStatCard(
                  title: "Total Visitors",
                  value: "1,245",
                  subtitle: "+12% from last week",
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: AppAppStatCard(
                  title: "Active Now",
                  value: "42",
                  subtitle: "Real-time users",
                  color: AppColors.success,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: AppAppStatCard(
                  title: "Blocked IPs",
                  value: "15",
                  subtitle: "Threats prevented",
                  color: AppColors.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildVisitorTable(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildVisitorTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Visitor Logs",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
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
                  const Icon(Icons.public, size: 16, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 8),
                  Text(item.country),
                ],
              ),
              Text(item.visits.toString()),
              Text(
                item.lastVisit,
                style: const TextStyle(color: Color(0xFF64748B)),
              ),
              item.isActive
                  ? AppStatusChip.success("Active")
                  : AppStatusChip.warning("Blocked"),
              const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
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
