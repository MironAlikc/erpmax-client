import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/shared/app_placeholder.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum BackupStatus { success, warning }

class BackupRecord {
  final String name;
  final String date;
  final String type;
  final String size;
  final BackupStatus status;

  const BackupRecord({
    required this.name,
    required this.date,
    required this.type,
    required this.size,
    required this.status,
  });
}

class BackupContent extends StatefulWidget {
  const BackupContent({super.key});

  @override
  State<BackupContent> createState() => _BackupContentState();
}

class _BackupContentState extends State<BackupContent> {
  String _selectedTab = 'Backup Management';

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: theme.white),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: ErpMaxTabFilter(
            items: _tabs,
            selectedItem: _selectedTab,
            onSelected: (name) => setState(() => _selectedTab = name),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedTab == 'Backup Management') ...[
                  _buildActionButton(),
                  const SizedBox(height: 24),
                  _buildMetricGrid(),
                  const SizedBox(height: 32),
                  _buildBackupTable(),
                  const SizedBox(height: 40),
                ] else
                  AppPlaceholder(title: _selectedTab),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    final theme = context.theme.appColor;

    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, size: 20),
        label: Text(AppLocalizations.of(context).createBackup),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.gray900,
          foregroundColor: theme.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildMetricGrid() {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final numberFormat = NumberFormat.decimalPattern(locale);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;

        final List<Widget> cards = [
          _buildColorStatCard(
            title: localizations.lastBackup,
            value: localizations.hoursAgo(2),
            subTitle: localizations.automatedDailyBackup,
            bgColor: theme.indigoBg,
            textColor: theme.indigoText,
          ),
          _buildColorStatCard(
            title: localizations.backupSize,
            value: "${numberFormat.format(1.2)} ${localizations.unitGb}",
            subTitle: localizations.totalStorageUsed(
              "45 ${localizations.unitGb}",
            ),
            bgColor: theme.successBg,
            textColor: theme.activeGreen,
          ),
          _buildColorStatCard(
            title: localizations.nextScheduled,
            value: "22:00:00",
            subTitle: localizations.dailyAtMidnight,
            bgColor: theme.violetBg,
            textColor: theme.violetText,
          ),
        ];

        return isMobile
            ? Column(
                children: cards
                    .map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: c,
                      ),
                    )
                    .toList(),
              )
            : Row(
                children: cards
                    .map(
                      (c) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: c,
                        ),
                      ),
                    )
                    .toList(),
              );
      },
    );
  }

  Widget _buildColorStatCard({
    required String title,
    required String value,
    required String subTitle,
    required Color bgColor,
    required Color textColor,
  }) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24),
      height: 140,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.h1.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.textPrimary,
            ),
          ),
          Text(
            subTitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackupTable() {
    final theme = context.theme.appColor;

    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: "Backup Name", weight: 0.3, isSortable: true),
      ErpMaxColumn(title: "Date", weight: 0.2, isSortable: true),
      ErpMaxColumn(title: "Backup Type", weight: 0.15),
      ErpMaxColumn(title: "Size", weight: 0.1),
      ErpMaxColumn(title: "Status", weight: 0.15),
      ErpMaxColumn(title: "Actions", weight: 0.05, textAlign: TextAlign.right),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.gray100),
      ),
      child: ErpMaxTable(
        columns: columns,
        minWidth: 1000,
        rows: _mockBackups.map((item) {
          return ErpMaxRow(
            columns: columns,
            cells: [
              Row(
                children: [
                  Icon(Icons.storage_outlined, size: 18, color: theme.gray400),
                  const SizedBox(width: 12),
                  Text(
                    item.name,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.gray700,
                    ),
                  ),
                ],
              ),
              Text(
                item.date,
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              _buildTypeBadge(item.type),
              Text(
                item.size,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.textPrimary,
                ),
              ),
              _buildStatusBadge(item.status),
              Icon(Icons.more_horiz, color: theme.gray400),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTypeBadge(String type) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: theme.border),
      ),
      child: Text(
        type,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: theme.textSecondary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BackupStatus status) {
    final theme = context.theme.appColor;
    final isSuccess = status == BackupStatus.success;

    final bgColor = isSuccess ? theme.successLight : theme.errorLight;
    final textColor = isSuccess ? theme.successText : theme.errorText;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isSuccess ? "Success" : "Warning",
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  final List<ErpMaxTabItem> _tabs = [
    const ErpMaxTabItem(name: 'Backup Management', icon: Icons.storage_rounded),
    const ErpMaxTabItem(
      name: 'Backup Monitoring',
      icon: Icons.visibility_outlined,
    ),
    const ErpMaxTabItem(
      name: 'Backup Schedules',
      icon: Icons.calendar_today_rounded,
    ),
    const ErpMaxTabItem(name: 'Settings', icon: Icons.settings_outlined),
  ];
}

final List<BackupRecord> _mockBackups = [
  const BackupRecord(
    name: "Auto-Backup-Daily",
    date: "2024-03-15 00:00",
    type: "Automated",
    size: "1.2 GB",
    status: BackupStatus.success,
  ),
  const BackupRecord(
    name: "Auto-Backup-Daily",
    date: "2024-03-14 00:00",
    type: "Automated",
    size: "1.1 GB",
    status: BackupStatus.success,
  ),
  const BackupRecord(
    name: "Manual-Pre-Update",
    date: "2024-03-13 14:30",
    type: "Manual",
    size: "1.1 GB",
    status: BackupStatus.success,
  ),
  const BackupRecord(
    name: "Auto-Backup-Daily",
    date: "2024-03-13 00:00",
    type: "Automated",
    size: "1.0 GB",
    status: BackupStatus.success,
  ),
  const BackupRecord(
    name: "Auto-Backup-Daily",
    date: "2024-03-12 00:00",
    type: "Automated",
    size: "1.0 GB",
    status: BackupStatus.warning,
  ),
];
