import 'package:flutter/material.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/models/menu_item_model.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/sidebar/sidebar_menu.dart';

class MobileDrawer extends StatelessWidget {
  final List<MenuItemModel> coreModules;
  final List<MenuItemModel> business;
  final List<MenuItemModel> tools;
  final List<MenuItemModel> settings;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const MobileDrawer({
    super.key,
    required this.coreModules,
    required this.business,
    required this.tools,
    required this.settings,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SidebarMenu(
          isExpanded: true,
          modules: coreModules,
          business: business,
          tools: tools,
          settings: settings,
          selectedIndex: selectedIndex,
          onSelect: (index) {
            onSelect(index);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
