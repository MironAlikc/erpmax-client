import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/erp_models.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

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
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: theme.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(localizations.accessLogs, style: AppTextStyles.h2),
          ),
          ErpMaxDataTable<AccessLogRecord>(
            items: _mockAccessLogs,
            minWidth: 1000,
            columns: [
              ErpMaxColumn(
                title: localizations.user,
                weight: 0.2,
                isSortable: true,
              ),
              ErpMaxColumn(title: localizations.company, weight: 0.2),
              ErpMaxColumn(title: localizations.ipAddress, weight: 0.15),
              ErpMaxColumn(title: localizations.device, weight: 0.2),
              ErpMaxColumn(
                title: localizations.date,
                weight: 0.15,
                isSortable: true,
              ),
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
                  ? AppStatusChip.success(localizations.success)
                  : AppStatusChip.danger(localizations.failed),
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
