import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';

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

class AccessLogsContent extends StatefulWidget {
  const AccessLogsContent({super.key});

  @override
  State<AccessLogsContent> createState() => _AccessLogsContentState();
}

class _AccessLogsContentState extends State<AccessLogsContent> {
  Set<String> _selectedLogIds = {};

  static const List<AccessLogRecord> _mockAccessLogs = [
    AccessLogRecord(
      user: "Ahmed Mohamed",
      company: "Tech Solutions",
      ipAddress: "192.168.1.1",
      device: "Chrome / Windows",
      date: "2024-03-15 10:30 AM",
      isSuccess: true,
    ),
    AccessLogRecord(
      user: "Sarah Ali",
      company: "Al-Amal Trading",
      ipAddress: "192.168.1.45",
      device: "Safari / Mac",
      date: "2024-03-15 10:32 AM",
      isSuccess: true,
    ),
    AccessLogRecord(
      user: "Khaled Omar",
      company: "Future Vision",
      ipAddress: "10.0.0.5",
      device: "Firefox / Linux",
      date: "2024-03-15 10:45 AM",
      isSuccess: false,
    ),
    AccessLogRecord(
      user: "Admin",
      company: "System",
      ipAddress: "127.0.0.1",
      device: "Edge / Windows",
      date: "2024-03-15 11:00 AM",
      isSuccess: true,
    ),
    AccessLogRecord(
      user: "Mona Ahmed",
      company: "Tech Solutions",
      ipAddress: "192.168.1.2",
      device: "Chrome / Android",
      date: "2024-03-15 11:15 AM",
      isSuccess: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    // Определение колонок для новой таблицы
    final List<ErpMaxColumn<AccessLogRecord>> columns = [
      ErpMaxColumn(
        id: 'user',
        title: localizations.user,
        weight: 2.0,
        valueGetter: (i) => i.user,
        customCell: (item) =>
            Text(item.user, style: AppTextStyles.bodyMediumBold),
      ),
      ErpMaxColumn(
        id: 'company',
        title: localizations.colCompanyName,
        weight: 2.0,
        valueGetter: (i) => i.company,
        customCell: (item) => Text(
          item.company,
          style: AppTextStyles.bodyMedium.copyWith(color: theme.gray600),
        ),
      ),
      ErpMaxColumn(
        id: 'ip',
        title: localizations.ipAddress,
        weight: 1.5,
        valueGetter: (i) => i.ipAddress,
      ),
      ErpMaxColumn(
        id: 'device',
        title: localizations.device,
        weight: 2.5,
        valueGetter: (i) => i.device,
        customCell: (item) => Text(item.device, style: AppTextStyles.bodySmall),
      ),
      ErpMaxColumn(
        id: 'date',
        title: localizations.date,
        weight: 2.0,
        valueGetter: (i) => i.date,
        customCell: (item) => Text(item.date, style: AppTextStyles.bodySmall),
      ),
      ErpMaxColumn(
        id: 'status',
        title: localizations.status,
        weight: 1.5,
        textAlign: TextAlign.center,
        valueGetter: (i) => i.isSuccess ? 'Success' : 'Failed',
        customCell: (item) =>
            _buildStatusBadge(localizations, theme, item.isSuccess),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UniversalErpTable<AccessLogRecord>(
              items: _mockAccessLogs,
              columns: columns,
              minWidth: 1100,
              // Используем комбинацию пользователя и даты как ID для уникальности
              idGetter: (item) => "${item.user}_${item.date}",
              selectedIds: _selectedLogIds,
              onSelectionChanged: (newSelection) {
                setState(() => _selectedLogIds = newSelection);
              },
              totals: {
                'user': 'Total Logs: ${_mockAccessLogs.length}',
                'status':
                    'Failed: ${_mockAccessLogs.where((l) => !l.isSuccess).length}',
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(
    AppLocalizations localizations,
    AppColorExtension colors,
    bool isSuccess,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSuccess ? colors.successBg : colors.errorBg,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: (isSuccess ? colors.success : colors.error).withValues(
            alpha: 0.2,
          ),
        ),
      ),
      child: Text(
        isSuccess ? localizations.success : localizations.failed,
        style: AppTextStyles.bodySmall.copyWith(
          color: isSuccess ? colors.successText : colors.errorText,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
