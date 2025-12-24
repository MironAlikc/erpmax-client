import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
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
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, size: 20),
        label: const Text("Create Backup"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildMetricGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        final List<Widget> cards = [
          _buildColorStatCard(
            title: "Last Backup",
            value: "2 hours ago",
            subTitle: "Automated Daily Backup",
            bgColor: const Color(0xFFEEF2FF),
            textColor: const Color(0xFF4F46E5),
          ),
          _buildColorStatCard(
            title: "Backup Size",
            value: "1.2 GB",
            subTitle: "Total storage used: 45 GB",
            bgColor: const Color(0xFFF0FDF4),
            textColor: const Color(0xFF16A34A),
          ),
          _buildColorStatCard(
            title: "Next Scheduled",
            value: "22:00:00",
            subTitle: "Daily at midnight",
            bgColor: const Color(0xFFF5F3FF),
            textColor: const Color(0xFF7C3AED),
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
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          Text(
            subTitle,
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBackupTable() {
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
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
                  const Icon(
                    Icons.storage_outlined,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
                    ),
                  ),
                ],
              ),
              Text(item.date, style: const TextStyle(color: Color(0xFF64748B))),
              _buildTypeBadge(item.type),
              Text(
                item.size,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              _buildStatusBadge(item.status),
              const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTypeBadge(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(
        type,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusBadge(BackupStatus status) {
    final isSuccess = status == BackupStatus.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isSuccess ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isSuccess ? "Success" : "Warning",
        style: TextStyle(
          color: isSuccess ? const Color(0xFF166534) : const Color(0xFF991B1B),
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
