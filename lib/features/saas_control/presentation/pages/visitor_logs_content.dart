import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';

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

class VisitorLogsContent extends StatefulWidget {
  const VisitorLogsContent({super.key});

  @override
  State<VisitorLogsContent> createState() => _VisitorLogsContentState();
}

class _VisitorLogsContentState extends State<VisitorLogsContent> {
  Set<String> _selectedVisitorIps = {};

  static const List<VisitorRecord> _mockVisitors = [
    VisitorRecord(
      ipAddress: "192.168.1.101",
      country: "Saudi Arabia",
      visits: 15,
      lastVisit: "2024-03-15 14:30",
      isActive: true,
    ),
    VisitorRecord(
      ipAddress: "10.0.0.55",
      country: "UAE",
      visits: 8,
      lastVisit: "2024-03-15 14:25",
      isActive: true,
    ),
    VisitorRecord(
      ipAddress: "172.16.0.23",
      country: "Egypt",
      visits: 3,
      lastVisit: "2024-03-15 14:10",
      isActive: false,
    ),
    VisitorRecord(
      ipAddress: "192.168.1.105",
      country: "Saudi Arabia",
      visits: 42,
      lastVisit: "2024-03-15 14:05",
      isActive: true,
    ),
    VisitorRecord(
      ipAddress: "203.0.113.1",
      country: "USA",
      visits: 1,
      lastVisit: "2024-03-15 13:55",
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;
    final double horizontalPadding = isMobile ? 16 : 24;
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    // Определение колонок для новой универсальной таблицы
    final List<ErpMaxColumn<VisitorRecord>> columns = [
      ErpMaxColumn(
        id: 'ip',
        title: localizations.ipAddress,
        weight: 2.5,
        valueGetter: (i) => i.ipAddress,
        customCell: (item) => Text(
          item.ipAddress,
          style: AppTextStyles.bodyMediumBold.copyWith(
            color: theme.textPrimary,
          ),
        ),
      ),
      ErpMaxColumn(
        id: 'country',
        title: localizations.country,
        weight: 2.0,
        valueGetter: (i) => i.country,
        customCell: (item) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public, size: 16, color: theme.gray400),
            const SizedBox(width: 8),
            Text(item.country, style: AppTextStyles.bodyMedium),
          ],
        ),
      ),
      ErpMaxColumn(
        id: 'visits',
        title: localizations.visits,
        weight: 1.0,
        textAlign: TextAlign.center,
        valueGetter: (i) => i.visits.toString(),
      ),
      ErpMaxColumn(
        id: 'lastVisit',
        title: localizations.lastVisit,
        weight: 2.0,
        valueGetter: (i) => i.lastVisit,
        customCell: (item) => Text(
          item.lastVisit,
          style: AppTextStyles.bodyMedium.copyWith(color: theme.textSecondary),
        ),
      ),
      ErpMaxColumn(
        id: 'status',
        title: localizations.status,
        weight: 1.5,
        valueGetter: (i) => i.isActive ? 'Active' : 'Blocked',
        customCell: (item) => _buildStatusChip(context, item.isActive),
      ),
      ErpMaxColumn(
        id: 'actions',
        title: localizations.actions,
        weight: 1.0,
        textAlign: TextAlign.right,
        isSortable: false,
        hasFilter: false,
        customCell: (item) => Icon(Icons.more_horiz, color: theme.gray400),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAdaptiveStatsGrid(context, isMobile),
            const SizedBox(height: 32),
            UniversalErpTable<VisitorRecord>(
              items: _mockVisitors,
              columns: columns,
              minWidth: 900,
              idGetter: (item) => item.ipAddress,
              selectedIds: _selectedVisitorIps,
              onSelectionChanged: (newSelection) {
                setState(() => _selectedVisitorIps = newSelection);
              },
              onRowTap: (item) => _showVisitorDetails(context, item),
              totals: {
                'ip': 'Total: ${_mockVisitors.length}',
                'visits':
                    'Sum: ${_mockVisitors.fold(0, (sum, item) => sum + item.visits)}',
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAdaptiveStatsGrid(BuildContext context, bool isMobile) {
    final theme = context.theme.appColor;
    final List<Widget> stats = [
      _buildStatCard(
        theme,
        "Total Visitors",
        "1,245",
        "+12% from last week",
        theme.indigoBg,
        theme.indigoText,
      ),
      _buildStatCard(
        theme,
        "Active Now",
        "42",
        "Real-time users",
        theme.successLight,
        theme.success,
      ),
      _buildStatCard(
        theme,
        "Blocked IPs",
        "15",
        "Threats prevented",
        theme.errorLight,
        theme.error,
      ),
    ];

    return isMobile
        ? Column(
            children: stats
                .map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: s,
                  ),
                )
                .toList(),
          )
        : Row(
            children: stats
                .map(
                  (s) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: s,
                    ),
                  ),
                )
                .toList(),
          );
  }

  Widget _buildStatCard(
    AppColorExtension colors,
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
          Text(title, style: AppTextStyles.bodySmallBold.copyWith(color: text)),
          Text(
            value,
            style: AppTextStyles.h1.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary,
            ),
          ),
          Text(
            sub,
            style: AppTextStyles.bodySmall.copyWith(
              color: colors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, bool isActive) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? theme.successLight : theme.errorLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? localizations.active : localizations.blocked,
        style: AppTextStyles.bodySmall.copyWith(
          color: isActive ? theme.successText : theme.errorText,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showVisitorDetails(BuildContext context, VisitorRecord record) {
    final localizations = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.ipDetails(record.ipAddress)),
        content: Text(
          localizations.visitorStats(record.country, record.visits),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.close),
          ),
        ],
      ),
    );
  }
}
