import 'package:erpmax_client/features/dashboard/presentation/widgets/sidebar/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';

class MobileDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const MobileDrawer({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          _buildDrawerHeader(context),
          Expanded(
            child: SidebarMenu(
              isExpanded: true,
              selectedIndex: selectedIndex,
              onSelect: (index) {
                onSelect(index);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.blur_on, color: Theme.of(context).primaryColor, size: 32),
          const SizedBox(width: 12),
          const Text(
            'ERP Max',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
