import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';

class PermissionRecord {
  final String roleName;
  final String description;
  final int usersCount;
  final String type; // System or Custom

  const PermissionRecord({
    required this.roleName,
    required this.description,
    required this.usersCount,
    required this.type,
  });
}

class PermissionsContent extends StatefulWidget {
  const PermissionsContent({super.key});

  @override
  State<PermissionsContent> createState() => _PermissionsContentState();
}

class _PermissionsContentState extends State<PermissionsContent> {
  int _innerTabIndex = 0; // 0: Roles, 1: Resellers

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          
          // 1. Внутренние табы (как на фото)
          _buildInnerTabs(),
          const SizedBox(height: 24),

          // 2. Строка поиска и кнопка Add Role
          _buildActionRow(),
          const SizedBox(height: 24),

          // 3. Таблица прав
          _buildRolesTable(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildInnerTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _innerTabItem("Roles & Permissions", 0, Icons.shield_outlined),
          _innerTabItem("Resellers & Agents", 1, Icons.people_outline),
        ],
      ),
    );
  }

  Widget _innerTabItem(String label, int index, IconData icon) {
    final isSelected = _innerTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _innerTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0F172A) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? Colors.white : const Color(0xFF64748B)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Roles...",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text("Add Role"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0F172A),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildRolesTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(Icons.shield_outlined, size: 20, color: Color(0xFF1E293B)),
                SizedBox(width: 12),
                Text("Roles List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ErpMaxDataTable<PermissionRecord>(
            items: _mockRoles,
            columns: [
              ErpMaxColumn(title: "Role Name", weight: 0.25),
              ErpMaxColumn(title: "Description", weight: 0.4),
              ErpMaxColumn(title: "Users Count", weight: 0.15),
              ErpMaxColumn(title: "Type", weight: 0.1),
              ErpMaxColumn(title: "Actions", weight: 0.1, textAlign: TextAlign.right),
            ],
            rowBuilder: (item) => [
              Text(item.roleName, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(item.description, style: const TextStyle(color: Color(0xFF64748B))),
              Row(
                children: [
                  const Icon(Icons.people_outline, size: 16, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 6),
                  Text(item.usersCount.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              AppStatusChip.neutral(item.type),
              const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
            ],
          ),
        ],
      ),
    );
  }
}

final List<PermissionRecord> _mockRoles = [
  const PermissionRecord(roleName: "Super Admin", description: "Full access to all system features", usersCount: 2, type: "System"),
  const PermissionRecord(roleName: "Support Agent", description: "Access to subscriber details and logs", usersCount: 5, type: "Custom"),
  const PermissionRecord(roleName: "Sales Manager", description: "Access to reports and revenue data", usersCount: 3, type: "Custom"),
];