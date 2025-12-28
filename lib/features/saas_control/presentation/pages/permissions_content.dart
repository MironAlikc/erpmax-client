import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class PermissionRecord {
  final String roleName;
  final String description;
  final int usersCount;
  final String type;

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
  int _innerTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _buildInnerTabs(),
          const SizedBox(height: 24),
          _buildActionRow(),
          const SizedBox(height: 24),
          _buildRolesTable(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildInnerTabs() {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.gray100,
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
    final theme = context.theme.appColor;
    final isSelected = _innerTabIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _innerTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? theme.gray900 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? theme.white : theme.gray500,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.sidebarItemActive.copyWith(color: theme.white)
                  : AppTextStyles.sidebarItem.copyWith(color: theme.gray500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow() {
    final theme = context.theme.appColor;

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Roles...",
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: theme.gray400,
              ),
              prefixIcon: Icon(Icons.search, color: theme.gray400),
              filled: true,
              fillColor: theme.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: theme.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: theme.borderLight),
              ),
            ),
            style: AppTextStyles.bodyMedium,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: Text("Add Role", style: AppTextStyles.button),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.gray900,
            foregroundColor: theme.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildRolesTable() {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(Icons.shield_outlined, size: 20, color: theme.gray800),
                const SizedBox(width: 12),
                Text(
                  "Roles List",
                  style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
                ),
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
              ErpMaxColumn(
                title: "Actions",
                weight: 0.1,
                textAlign: TextAlign.right,
              ),
            ],
            rowBuilder: (item) => [
              Text(
                item.roleName,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: theme.textPrimary,
                ),
              ),
              Text(
                item.description,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.people_outline, size: 16, color: theme.gray400),
                  const SizedBox(width: 6),
                  Text(
                    item.usersCount.toString(),
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
              AppStatusChip.neutral(item.type),
              Icon(Icons.more_horiz, color: theme.gray400),
            ],
          ),
        ],
      ),
    );
  }
}

final List<PermissionRecord> _mockRoles = [
  const PermissionRecord(
    roleName: "Super Admin",
    description: "Full access to all system features",
    usersCount: 2,
    type: "System",
  ),
  const PermissionRecord(
    roleName: "Support Agent",
    description: "Access to subscriber details and logs",
    usersCount: 5,
    type: "Custom",
  ),
  const PermissionRecord(
    roleName: "Sales Manager",
    description: "Access to reports and revenue data",
    usersCount: 3,
    type: "Custom",
  ),
];
