import 'package:erpmax_client/core/navigation/presentation/layout/widgets/sidebar_menu.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

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
    final theme = context.theme.appColor;

    return Drawer(
      backgroundColor: theme.white,
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
          Text(
            'ERP Max',
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
