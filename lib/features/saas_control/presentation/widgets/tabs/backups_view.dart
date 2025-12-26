import 'package:erpmax_client/features/saas_control/presentation/widgets/shared/common_tab_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_section.dart';
import '../shared/backup_stat_cards_row.dart';
import '../shared/backups_status_elements.dart';
import '../shared/backup_action_buttons.dart';

class BackupsView extends StatelessWidget {
  const BackupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BackupsHeader(),
        const SizedBox(height: 32),
        const BackupStatCardsRow(),
        const SizedBox(height: 32),
        AppSection(
          title: "Backup History",
          child: ErpMaxDataTable<Map<String, dynamic>>(
            minWidth: 1100,
            columns: _getColumns(),
            items: _getMockData(),
            rowBuilder: (item) => [
              _BackupNameCell(name: item["name"]),
              BackupTypeBadge(type: item["type"]),
              Text(item["date"], style: AppTextStyles.bodySmall),
              Text(item["size"], style: AppTextStyles.bodySmall),
              Text(
                item["duration"],
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF667085),
                ),
              ),
              Wrap(
                spacing: 4,
                children: (item["tags"] as List<String>)
                    .map((t) => BackupTag(text: t))
                    .toList(),
              ),
              BackupStatusBadge(status: item["status"]),
              const _BackupRowActions(),
            ],
          ),
        ),
      ],
    );
  }

  List<ErpMaxColumn> _getColumns() => [
    ErpMaxColumn(title: "Backup Name", weight: 0.25),
    ErpMaxColumn(title: "Type", weight: 0.12, textAlign: TextAlign.center),
    ErpMaxColumn(title: "Date", weight: 0.18),
    ErpMaxColumn(title: "Size", weight: 0.1),
    ErpMaxColumn(title: "Duration", weight: 0.1),
    ErpMaxColumn(title: "Includes", weight: 0.15),
    ErpMaxColumn(title: "Status", weight: 0.12),
    ErpMaxColumn(title: "Actions", weight: 0.12, textAlign: TextAlign.right),
  ];

  List<Map<String, dynamic>> _getMockData() => [
    {
      "name": "daily-auto-backup",
      "type": "Automated",
      "date": "2024-01-25 00:00",
      "size": "856 MB",
      "duration": "5m 23s",
      "status": "Success",
      "tags": ["database", "files"],
    },
    {
      "name": "pre-migration-backup",
      "type": "Manual",
      "date": "2024-01-24 14:30",
      "size": "892 MB",
      "duration": "6m 12s",
      "status": "Success",
      "tags": ["database", "files"],
    },
    {
      "name": "weekly-system-snap",
      "type": "Automated",
      "date": "2024-01-20 02:00",
      "size": "1.2 GB",
      "duration": "12m 45s",
      "status": "Success",
      "tags": ["database", "configs"],
    },
  ];
}

class _BackupNameCell extends StatelessWidget {
  final String name;
  const _BackupNameCell({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.layers_alt,
          size: 16,
          color: Color(0xFF98A2B3),
        ),
        const SizedBox(width: 8),
        Text(name, style: AppTextStyles.bodySmallBold),
      ],
    );
  }
}

class _BackupRowActions extends StatelessWidget {
  const _BackupRowActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.refresh, size: 18),
          onPressed: () {},
          tooltip: "Restore",
        ),
        IconButton(
          icon: const Icon(Icons.download_outlined, size: 18),
          onPressed: () {},
          tooltip: "Download",
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
          onPressed: () {},
          tooltip: "Delete",
        ),
      ],
    );
  }
}

class _BackupsHeader extends StatelessWidget {
  const _BackupsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.layers_alt_fill,
          color: Color(0xFF10B981),
          size: 28,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TabHeaderTitle(
            title: "Backups",
            subtitle: "Manage tenant-specific backups and snapshots",
          ),
        ),
        BackupSecondaryButton(
          icon: Icons.settings_outlined,
          label: "Backup Settings",
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        BackupPrimaryButton(
          icon: Icons.add,
          label: "Create Backup Now",
          onPressed: () {},
        ),
      ],
    );
  }
}

// ignore: unused_element
class _BackupTenantBadge extends StatelessWidget {
  final String text;
  const _BackupTenantBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.theme.appColor.borderLight,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.theme.appColor.border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
