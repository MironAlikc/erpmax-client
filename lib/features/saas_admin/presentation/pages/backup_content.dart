import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/shared/app_placeholder.dart';

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
            _buildActionHeader(),
            const SizedBox(height: 24),
            _buildStatsGrid(),
            const SizedBox(height: 32),
            _buildBackupTable(),
          ] else ...[
            AppPlaceholder(title: _selectedTab),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildActionHeader() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.storage_rounded, size: 18, color: Colors.white),
        label: const Text("Create Backup"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(
          child: AppAppStatCard(
            title: "Last Backup",
            value: "2 hours ago",
            subtitle: "Automated Daily",
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: AppAppStatCard(
            title: "Backup Size",
            value: "1.2 GB",
            subtitle: "Used: 45 GB",
            color: AppColors.success,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: AppAppStatCard(
            title: "Next Scheduled",
            value: "22:00:00",
            subtitle: "Daily midnight",
            color: Color(0xFF8B5CF6),
          ),
        ),
      ],
    );
  }

  Widget _buildBackupTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Recent Backups",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
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
                  const Icon(
                    Icons.storage_outlined,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(item.date, style: const TextStyle(color: Color(0xFF64748B))),
              AppStatusChip.neutral(item.type),
              Text(item.size, style: const TextStyle(color: Color(0xFF1E293B))),
              item.status == BackupStatus.success
                  ? AppStatusChip.success("Success")
                  : AppStatusChip.warning("Warning"),
              const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
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
