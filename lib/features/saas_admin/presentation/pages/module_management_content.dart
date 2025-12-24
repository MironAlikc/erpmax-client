import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

class ModuleModel {
  final String name;
  final List<String> packages;
  final String version;
  final bool isActive;

  const ModuleModel({
    required this.name,
    required this.packages,
    required this.version,
    required this.isActive,
  });
}

class ModuleManagementContent extends StatefulWidget {
  const ModuleManagementContent({super.key});

  @override
  State<ModuleManagementContent> createState() =>
      _ModuleManagementContentState();
}

class _ModuleManagementContentState extends State<ModuleManagementContent> {
  static const List<ModuleModel> _modules = [
    ModuleModel(
      name: "Accounting",
      packages: ["Starter", "Professional", "Enterprise"],
      version: "v2.1.0",
      isActive: true,
    ),
    ModuleModel(
      name: "Inventory",
      packages: ["Professional", "Enterprise"],
      version: "v1.5.2",
      isActive: true,
    ),
    ModuleModel(
      name: "Sales",
      packages: ["Starter", "Professional", "Enterprise"],
      version: "v2.0.1",
      isActive: true,
    ),
    ModuleModel(
      name: "Purchases",
      packages: ["Professional", "Enterprise"],
      version: "v1.8.0",
      isActive: true,
    ),
    ModuleModel(
      name: "HR & Payroll",
      packages: ["Enterprise"],
      version: "v1.0.0",
      isActive: false,
    ),
    ModuleModel(
      name: "CRM",
      packages: ["Professional", "Enterprise"],
      version: "v1.2.0",
      isActive: true,
    ),
    ModuleModel(
      name: "AI Analytics",
      packages: ["Enterprise"],
      version: "v0.9.5",
      isActive: true,
    ),
    ModuleModel(
      name: "SaaS Control",
      packages: ["Enterprise"],
      version: "v1.1.0",
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Растягиваем колонку
              children: [const SizedBox(height: 32), _buildModuleTable()],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModuleTable() {
    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: "Module Name", weight: 0.25),
      ErpMaxColumn(title: "Assigned Packages", weight: 0.4),
      ErpMaxColumn(title: "Version", weight: 0.15),
      ErpMaxColumn(title: "Status", weight: 0.15),
      ErpMaxColumn(title: "Actions", weight: 0.05, textAlign: TextAlign.right),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErpMaxTable(
            columns: columns,
            minWidth: 900,
            rows: _modules.map((item) {
              return ErpMaxRow(
                columns: columns,
                cells: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  _buildPackageBadges(item.packages),
                  Text(
                    item.version,
                    style: const TextStyle(color: Color(0xFF64748B)),
                  ),
                  _buildStatusBadge(item.isActive),
                  const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageBadges(List<String> packages) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: packages
          .map(
            (p) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Text(
                p,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: TextStyle(
          color: isActive ? const Color(0xFF166534) : const Color(0xFF64748B),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
