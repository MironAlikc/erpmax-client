import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/shared/app_placeholder.dart';
import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

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

  final List<ErpMaxTabItem> _tabs = [
    const ErpMaxTabItem(name: 'Backup Management', icon: Icons.storage_rounded),
    const ErpMaxTabItem(
      name: 'Backup Schedules',
      icon: Icons.calendar_today_rounded,
    ),
    const ErpMaxTabItem(name: 'Settings', icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErpMaxTabFilter(
            items: _tabs,
            selectedItem: _selectedTab,
            onSelected: (name) => setState(() => _selectedTab = name),
          ),
          const SizedBox(height: 24),
          if (_selectedTab == 'Backup Management') ...[
            _buildActionHeader(context),
            const SizedBox(height: 24),
            _buildStatsGrid(context),
            const SizedBox(height: 32),
            _buildBackupTable(context),
          ] else ...[
            AppPlaceholder(title: _selectedTab),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildActionHeader(BuildContext context) {
    final theme = context.theme.appColor;

    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.storage_rounded, size: 18, color: theme.white),
        label: Text("Create Backup", style: AppTextStyles.buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.gray900,
          foregroundColor: theme.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final theme = context.theme.appColor;

    return Row(
      children: [
        Expanded(
          child: AppAppStatCard(
            title: "Last Backup",
            value: "2 hours ago",
            subtitle: "Automated Daily",
            color: theme.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppAppStatCard(
            title: "Backup Size",
            value: "1.2 GB",
            subtitle: "Used: 45 GB",
            color: theme.success,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppAppStatCard(
            title: "Next Scheduled",
            value: "22:00:00",
            subtitle: "Daily midnight",
            color: theme.warning,
          ),
        ),
      ],
    );
  }

  Widget _buildBackupTable(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "Recent Backups",
              style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
            ),
          ),
          ErpMaxDataTable<BackupRecord>(
            items: _mockBackups,
            columns: [
              ErpMaxColumn(title: "Backup Name", weight: 0.3),
              ErpMaxColumn(title: "Date", weight: 0.2),
              ErpMaxColumn(title: "Backup Type", weight: 0.15),
              ErpMaxColumn(title: "Size", weight: 0.1),
              ErpMaxColumn(title: "Status", weight: 0.15),
              ErpMaxColumn(
                title: "Actions",
                weight: 0.1,
                textAlign: TextAlign.right,
              ),
            ],
            rowBuilder: (item) => [
              Row(
                children: [
                  Icon(Icons.storage_outlined, size: 18, color: theme.gray400),
                  const SizedBox(width: 12),
                  Text(
                    item.name,
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                item.date,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              AppStatusChip.neutral(item.type),
              Text(
                item.size,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textPrimary,
                ),
              ),
              item.status == BackupStatus.success
                  ? AppStatusChip.success("Success")
                  : AppStatusChip.warning("Warning"),
              Icon(Icons.more_horiz, color: theme.gray400),
            ],
          ),
        ],
      ),
    );
  }
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
