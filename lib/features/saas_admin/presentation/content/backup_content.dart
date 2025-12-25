import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/saas_models.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class BackupContent extends StatelessWidget {
  const BackupContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildStats(context),
          const SizedBox(height: 32),
          _buildBackupTable(context),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    final colors = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _statItem(
          localizations.lastBackup,
          localizations.timeAgo('2'),
          colors.primary,
          Icons.history,
        ),
        _statItem(
          localizations.storageUsed,
          "1.2 GB / 50 GB",
          colors.success,
          Icons.cloud_done,
        ),
        _statItem(
          localizations.nextSchedule,
          localizations.todayAt("22:00"),
          colors.warning,
          Icons.timer,
        ),
      ],
    );
  }

  Widget _statItem(String title, String val, Color color, IconData icon) {
    return SizedBox(
      width: 300,
      child: AppAppStatCard(title: title, value: val, color: color),
    );
  }

  Widget _buildBackupTable(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

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
              localizations.recentBackups,
              style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
            ),
          ),
          ErpMaxDataTable<BackupRecord>(
            items: _mockBackups,
            columns: [
              ErpMaxColumn(title: localizations.fileName, weight: 3),
              ErpMaxColumn(title: localizations.size, weight: 1),
              ErpMaxColumn(title: localizations.type, weight: 1),
              ErpMaxColumn(title: localizations.status, weight: 1),
            ],
            rowBuilder: (item) => [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                  Text(
                    item.date,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.textTertiary,
                    ),
                  ),
                ],
              ),
              Text(
                item.size,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textPrimary,
                ),
              ),
              AppStatusChip.neutral(item.type),
              item.isSuccess
                  ? AppStatusChip.success(localizations.completed)
                  : AppStatusChip.warning(localizations.partial),
            ],
          ),
        ],
      ),
    );
  }
}

final List<BackupRecord> _mockBackups = [
  const BackupRecord(
    name: "Daily_Auto_Backup_Full",
    date: "2025-12-21",
    type: "Auto",
    size: "450 MB",
    isSuccess: true,
  ),
  const BackupRecord(
    name: "Manual_Update_Final",
    date: "2025-12-20",
    type: "Manual",
    size: "1.2 GB",
    isSuccess: true,
  ),
  const BackupRecord(
    name: "System_State_Check",
    date: "2025-12-19",
    type: "Auto",
    size: "120 MB",
    isSuccess: false,
  ),
];
