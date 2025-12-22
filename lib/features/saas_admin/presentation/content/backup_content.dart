import 'package:erpmax_client/core/widgets/shared/app_stat_card.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/models/saas_models.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/common/app_status_chip.dart';

class BackupContent extends StatelessWidget {
  const BackupContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildStats(),
          const SizedBox(height: 32),
          _buildBackupTable(),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _statItem("Last Backup", "2 hours ago", Colors.blue, Icons.history),
        _statItem(
          "Storage Used",
          "1.2 GB / 50 GB",
          Colors.green,
          Icons.cloud_done,
        ),
        _statItem("Next Schedule", "Today 22:00", Colors.purple, Icons.timer),
      ],
    );
  }

  Widget _statItem(String title, String val, Color color, IconData icon) {
    return SizedBox(
      width: 300,
      child: AppAppStatCard(
        title: title,
        value: val,
        color: color,
        // Добавьте параметры в ваш AppAppStatCard если их нет
      ),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ErpMaxDataTable<BackupRecord>(
            items: _mockBackups,
            columns: [
              ErpMaxColumn(title: "File Name", weight: 3),
              ErpMaxColumn(title: "Size", weight: 1),
              ErpMaxColumn(title: "Type", weight: 1),
              ErpMaxColumn(title: "Status", weight: 1),
            ],
            rowBuilder: (item) => [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Text(item.size),
              AppStatusChip.neutral(item.type),
              item.isSuccess
                  ? AppStatusChip.success("Completed")
                  : AppStatusChip.warning("Partial"),
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
