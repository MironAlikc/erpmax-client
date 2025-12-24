import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';

class AccessLogRecord {
  final String user;
  final String company;
  final String ipAddress;
  final String device;
  final String date;
  final bool isSuccess;

  const AccessLogRecord({
    required this.user,
    required this.company,
    required this.ipAddress,
    required this.device,
    required this.date,
    required this.isSuccess,
  });
}

class AccessLogsContent extends StatelessWidget {
  const AccessLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double horizontalPadding = isMobile ? 16 : 24;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildLogsTable(context), const SizedBox(height: 40)],
      ),
    );
  }

  Widget _buildLogsTable(BuildContext context) {
    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(
        title: "User",
        weight: 0.2,
        isSortable: true,
        sortKey: 'user',
      ),
      ErpMaxColumn(title: "Company Name", weight: 0.2),
      ErpMaxColumn(title: "IP Address", weight: 0.15),
      ErpMaxColumn(title: "Device", weight: 0.25),
      ErpMaxColumn(
        title: "Date",
        weight: 0.15,
        isSortable: true,
        sortKey: 'date',
      ),
      ErpMaxColumn(title: "Status", weight: 0.1, textAlign: TextAlign.center),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ErpMaxTable(
              columns: columns,
              minWidth: 1100,
              rows: _mockAccessLogs.map((item) {
                return ErpMaxRow(
                  columns: columns,
                  cells: [
                    Text(item.user, style: AppTextStyles.bodyMediumBold),
                    Text(
                      item.company,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.gray600,
                      ),
                    ),
                    Text(item.ipAddress, style: AppTextStyles.bodyMedium),
                    Text(item.device, style: AppTextStyles.bodySmall),
                    Text(item.date, style: AppTextStyles.bodySmall),
                    _buildStatusBadge(item.isSuccess),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(bool isSuccess) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSuccess ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isSuccess
              ? const Color(0xFF10B981).withOpacity(0.2)
              : const Color(0xFFEF4444).withOpacity(0.2),
        ),
      ),
      child: Text(
        isSuccess ? "Success" : "Failed",
        style: TextStyle(
          color: isSuccess ? const Color(0xFF059669) : const Color(0xFFDC2626),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

final List<AccessLogRecord> _mockAccessLogs = [
  const AccessLogRecord(
    user: "Ahmed Mohamed",
    company: "Tech Solutions",
    ipAddress: "192.168.1.1",
    device: "Chrome / Windows",
    date: "2024-03-15 10:30 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Sarah Ali",
    company: "Al-Amal Trading",
    ipAddress: "192.168.1.45",
    device: "Safari / Mac",
    date: "2024-03-15 10:32 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Khaled Omar",
    company: "Future Vision",
    ipAddress: "10.0.0.5",
    device: "Firefox / Linux",
    date: "2024-03-15 10:45 AM",
    isSuccess: false,
  ),
  const AccessLogRecord(
    user: "Admin",
    company: "System",
    ipAddress: "127.0.0.1",
    device: "Edge / Windows",
    date: "2024-03-15 11:00 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Mona Ahmed",
    company: "Tech Solutions",
    ipAddress: "192.168.1.2",
    device: "Chrome / Android",
    date: "2024-03-15 11:15 AM",
    isSuccess: true,
  ),
];
