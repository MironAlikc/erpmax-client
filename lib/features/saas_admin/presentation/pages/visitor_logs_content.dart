import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class VisitorLogsContent extends StatelessWidget {
  const VisitorLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;
    final double horizontalPadding = isMobile ? 16 : 24;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAdaptiveStatsGrid(context, isMobile),
                const SizedBox(height: 32),
                _buildVisitorTable(context, isMobile),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdaptiveStatsGrid(BuildContext context, bool isMobile) {
    if (!isMobile) {
      return Row(
        children: [
          Expanded(
            child: _buildStatCard(
              "Total Visitors",
              "1,245",
              "+12% from last week",
              const Color(0xFFEEF2FF),
              const Color(0xFF4F46E5),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              "Active Now",
              "42",
              "Real-time users",
              const Color(0xFFF0FDF4),
              const Color(0xFF16A34A),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              "Blocked IPs",
              "15",
              "Threats prevented",
              const Color(0xFFFFF1F2),
              const Color(0xFFE11D48),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        _buildStatCard(
          "Total Visitors",
          "1,245",
          "+12%",
          const Color(0xFFEEF2FF),
          const Color(0xFF4F46E5),
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          "Active Now",
          "42",
          "Real-time",
          const Color(0xFFF0FDF4),
          const Color(0xFF16A34A),
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          "Blocked IPs",
          "15",
          "Threats",
          const Color(0xFFFFF1F2),
          const Color(0xFFE11D48),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String sub,
    Color bg,
    Color text,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 130,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(height: 8),

          // Row(
          //   children: [
          //     Expanded(
          //       child: AppAppStatCard(
          //         title: "Total Visitors",
          //         value: "1,245",
          //         subtitle: "+12% from last week",
          //         color: theme.primary,
          //       ),
          //     ),
          //     SizedBox(width: 20),
          //     Expanded(
          //       child: AppAppStatCard(
          //         title: "Active Now",
          //         value: "42",
          //         subtitle: "Real-time users",
          //         color: theme.success,
          //       ),
          //     ),
          //     SizedBox(width: 20),
          //     Expanded(
          //       child: AppAppStatCard(
          //         title: "Blocked IPs",
          //         value: "15",
          //         subtitle: "Threats prevented",
          //         color: theme.error,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 32),
          // _buildVisitorTable(theme),
          // const SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              color: text,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          Text(
            sub,
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Widget _buildVisitorTable(AppColorExtension theme) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: theme.white,
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: theme.inactiveBg),
  Widget _buildVisitorTable(BuildContext context, bool isMobile) {
    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: "IP Address", weight: 0.25, isSortable: true),
      ErpMaxColumn(title: "Country", weight: 0.2),
      ErpMaxColumn(title: "Visits", weight: 0.1, textAlign: TextAlign.center),
      ErpMaxColumn(title: "Last Visit", weight: 0.2),
      ErpMaxColumn(title: "Status", weight: 0.15),
      ErpMaxColumn(title: "Actions", weight: 0.1, textAlign: TextAlign.right),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(24),
          //   child: Text(
          //     "Visitor Logs",
          //     style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
          //   ),
          // ),
          // ErpMaxDataTable<VisitorRecord>(
          //   items: _mockVisitors,
          //   columns: [
          //     ErpMaxColumn(title: "IP Address", weight: 0.25),
          //     ErpMaxColumn(title: "Country", weight: 0.2),
          //     ErpMaxColumn(title: "Visits", weight: 0.1),
          //     ErpMaxColumn(title: "Last Visit", weight: 0.2),
          //     ErpMaxColumn(title: "Status", weight: 0.15),
          //     ErpMaxColumn(
          //       title: "Actions",
          //       weight: 0.1,
          //       textAlign: TextAlign.right,
          //     ),
          //   ],
          //   rowBuilder: (item) => [
          //     Text(
          //       item.ipAddress,
          //       style: const TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //     Row(
          //       children: [
          //         Icon(Icons.public, size: 16, color: theme.textDisabled),
          //         const SizedBox(width: 8),
          //         Text(item.country),
          //       ],
          //     ),
          //     Text(item.visits.toString()),
          //     Text(
          //       item.lastVisit,
          //       style: AppTextStyles.bodySmall.copyWith(
          //         color: theme.textSecondary,
          //       ),
          //     ),
          //     item.isActive
          //         ? AppStatusChip.success("Active")
          //         : AppStatusChip.warning("Blocked"),
          //     Icon(Icons.more_horiz, color: theme.textDisabled),
          //   ],
          ErpMaxTable(
            columns: columns,
            minWidth: 900,
            rows: _mockVisitors.map((item) {
              return ErpMaxRow(
                columns: columns,
                onTap: () => _showVisitorDetails(context, item),
                cells: [
                  Text(
                    item.ipAddress,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.public,
                        size: 16,
                        color: Color(0xFF94A3B8),
                      ),
                      const SizedBox(width: 8),
                      Text(item.country),
                    ],
                  ),
                  Text(item.visits.toString()),
                  Text(
                    item.lastVisit,
                    style: const TextStyle(color: Color(0xFF64748B)),
                  ),
                  _buildStatusChip(item.isActive),
                  const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? "Active" : "Blocked",
        style: TextStyle(
          color: isActive ? const Color(0xFF166534) : const Color(0xFF991B1B),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showVisitorDetails(BuildContext context, VisitorRecord record) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("IP Details: ${record.ipAddress}"),
        content: Text(
          "Visitor from ${record.country} has visited ${record.visits} times.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
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
