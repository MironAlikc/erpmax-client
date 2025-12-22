import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/models/erp_models.dart';

class AccessLogsContent extends StatelessWidget {
  const AccessLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogsTable(context),
          const SizedBox(height: AppDesign.sectionGap),
        ],
      ),
    );
  }

  Widget _buildLogsTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: AppColors.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text("Access Logs", style: AppTextStyles.h2),
          ),
          ErpMaxDataTable<AccessLogRecord>(
            items: _mockAccessLogs,
            minWidth: 1000,
            columns: [
              ErpMaxColumn(title: "User", weight: 0.2, isSortable: true),
              ErpMaxColumn(title: "Company", weight: 0.2),
              ErpMaxColumn(title: "IP Address", weight: 0.15),
              ErpMaxColumn(title: "Device", weight: 0.2),
              ErpMaxColumn(title: "Date", weight: 0.15, isSortable: true),
              ErpMaxColumn(
                title: "Status",
                weight: 0.1,
                textAlign: TextAlign.center,
              ),
            ],
            rowBuilder: (item) => [
              Text(item.user, style: AppTextStyles.bodyMediumBold),
              Text(item.company, style: AppTextStyles.bodySmall),
              Text(item.ipAddress, style: AppTextStyles.bodyMedium),
              Text(item.device, style: AppTextStyles.bodySmall),
              Text(item.date, style: AppTextStyles.bodySmall),
              item.isSuccess
                  ? AppStatusChip.success("Success")
                  : AppStatusChip.danger("Failed"),
            ],
          ),
        ],
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
