import 'package:erpmax_client/core/widgets/table/erpmax_table.dart'
    hide ErpMaxColumn;
import 'package:flutter/material.dart';

import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
  // Состояние для управления выделением строк
  Set<String> _selectedModuleNames = {};

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
    final theme = context.theme.appColor;

    // Определение колонок для UniversalErpTable
    final List<ErpMaxColumn<ModuleModel>> columns = [
      ErpMaxColumn(
        id: 'name',
        title: "Module Name",
        weight: 2.5,
        valueGetter: (item) => item.name,
        customCell: (item) => Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
      ),
      ErpMaxColumn(
        id: 'packages',
        title: "Assigned Packages",
        weight: 4.0,
        isSortable: false, // Список пакетов сложно сортировать по строке
        valueGetter: (item) => item.packages.join(", "),
        customCell: (item) => _buildPackageBadges(item.packages),
      ),
      ErpMaxColumn(
        id: 'version',
        title: "Version",
        weight: 1.5,
        valueGetter: (item) => item.version,
        customCell: (item) => Text(
          item.version,
          style: const TextStyle(color: Color(0xFF64748B)),
        ),
      ),
      ErpMaxColumn(
        id: 'status',
        title: "Status",
        weight: 1.5,
        valueGetter: (item) => item.isActive ? "Active" : "Inactive",
        customCell: (item) => _buildStatusBadge(item.isActive),
      ),
      ErpMaxColumn(
        id: 'actions',
        title: "Actions",
        weight: 1.0,
        textAlign: TextAlign.right,
        isSortable: false,
        hasFilter: false,
        customCell: (item) =>
            const Icon(LucideIcons.moreHorizontal, color: Color(0xFF94A3B8)),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            UniversalErpTable<ModuleModel>(
              items: _modules,
              columns: columns,
              minWidth: 900,
              idGetter: (item) => item.name,
              selectedIds: _selectedModuleNames,
              onSelectionChanged: (newSelection) {
                setState(() => _selectedModuleNames = newSelection);
              },
              showVerticalLines: true,
              // Добавляем статистику в футер
              totals: {
                'name': 'Total: ${_modules.length}',
                'status': 'Active: ${_modules.where((m) => m.isActive).length}',
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Вспомогательные виджеты для ячеек ---

  Widget _buildPackageBadges(List<String> packages) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Wrap(
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
      ),
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
