import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
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
    final theme = context.theme.appColor;

    if (!isMobile) {
      return Row(
        children: [
          Expanded(
            child: _buildStatCard(
              theme,
              "Total Visitors",
              "1,245",
              "+12% from last week",
              theme.indigoBg,
              theme.indigoText,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              theme,
              "Active Now",
              "42",
              "Real-time users",
              theme.successLight,
              theme.success,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              theme,
              "Blocked IPs",
              "15",
              "Threats prevented",
              theme.errorLight,
              theme.error,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        _buildStatCard(
          theme,
          "Total Visitors",
          "1,245",
          "+12%",
          theme.indigoBg,
          theme.indigoText,
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          theme,
          "Active Now",
          "42",
          "Real-time",
          theme.successLight,
          theme.success,
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          theme,
          "Blocked IPs",
          "15",
          "Threats",
          theme.errorLight,
          theme.error,
        ),
      ],
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

  Widget _buildVisitorTable(BuildContext context, bool isMobile) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(
        title: localizations.ipAddress,
        weight: 0.25,
        isSortable: true,
      ),
      ErpMaxColumn(title: localizations.country, weight: 0.2),
      ErpMaxColumn(
        title: localizations.visits,
        weight: 0.1,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(title: localizations.lastVisit, weight: 0.2),
      ErpMaxColumn(title: localizations.status, weight: 0.15),
      ErpMaxColumn(
        title: localizations.actions,
        weight: 0.1,
        textAlign: TextAlign.right,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.public, size: 16, color: theme.gray400),
                      const SizedBox(width: 8),
                      Text(
                        item.country,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.visits.toString(),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Text(
                    item.lastVisit,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  _buildStatusChip(context, theme, item.isActive),
                  Icon(Icons.more_horiz, color: theme.gray400),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(
    BuildContext context,
    AppColorExtension colors,
    bool isActive,
  ) {
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? colors.successLight : colors.errorLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? localizations.active : localizations.blocked,
        style: AppTextStyles.bodySmall.copyWith(
          color: isActive ? colors.successText : colors.errorText,
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
