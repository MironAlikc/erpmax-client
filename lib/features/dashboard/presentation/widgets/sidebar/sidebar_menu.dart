// lib/features/dashboard/presentation/widgets/sidebar/sidebar_menu.dart

import 'package:flutter/material.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/models/menu_data.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/models/menu_item_model.dart';
import 'sidebar_menu_item.dart';

class SidebarMenu extends StatefulWidget {
  final bool isExpanded;
  final List<MenuItemModel> modules;
  final List<MenuItemModel> business;
  final List<MenuItemModel> tools;
  final List<MenuItemModel> settings;
  final int selectedIndex;
  final Function(int) onSelect;

  const SidebarMenu({
    super.key,
    required this.isExpanded,
    required this.modules,
    required this.business,
    required this.tools,
    required this.settings,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  static const double _horizontalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (widget.isExpanded)
          _buildSidebarSectionHeader(context, 'Accounting'),
        ..._buildMenuItems(MenuData.coreModules),

        if (widget.isExpanded)
          _buildSidebarSectionHeader(context, 'Business Management'),
        ..._buildMenuItems(MenuData.businessManagement),

        if (widget.isExpanded)
          _buildSidebarSectionHeader(context, 'System Tools'),
        ..._buildMenuItems(MenuData.systemTools),

        if (widget.isExpanded) _buildSidebarSectionHeader(context, 'Settings'),
        ..._buildMenuItems(MenuData.settings),

        const SizedBox(height: 16),
        _buildHelpSection(context, widget.isExpanded),
      ],
    );
  }

  Widget _buildSidebarSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: 12,
      ),
      child: Text(
        title,
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.disabledColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems(List<MenuItemModel> items) {
    List<Widget> widgets = [];
    final allItems = MenuData.getAllMenuItems();

    for (var item in items) {
      final index = allItems.indexWhere((i) => i.title == item.title);
      final isSelected = index == widget.selectedIndex;

      if (index == -1) continue;

      widgets.add(_buildMenuItemWidget(item, index, isSelected));
      if (item.children != null && isSelected && widget.isExpanded) {
        for (var childItem in item.children!) {
          final childIndex = allItems.indexWhere(
            (i) => i.title == childItem.title,
          );
          if (childIndex == -1) continue;
          final isChildSelected = childIndex == widget.selectedIndex;
          widgets.add(
            _buildSubMenuItemWidget(childItem, childIndex, isChildSelected),
          );
        }
      }
    }
    return widgets;
  }

  Widget _buildMenuItemWidget(MenuItemModel item, int index, bool isSelected) {
    return SidebarMenuItem(
      item: item,
      isSelected: isSelected,
      isExpanded: widget.isExpanded,
      onTap: () => widget.onSelect(index),
    );
  }

  Widget _buildSubMenuItemWidget(
    MenuItemModel item,
    int index,
    bool isSelected,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.isExpanded ? 36.0 : 0.0,
        right: 8.0,
      ),
      child: SidebarMenuItem(
        item: item,
        isSelected: isSelected,
        isExpanded: widget.isExpanded,
        onTap: () => widget.onSelect(index),
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context, bool isExpanded) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (!isExpanded) {
      return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: Center(
          child: IconButton(
            icon: Icon(
              Icons.help_outline,
              color: theme.disabledColor,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(_horizontalPadding),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              'Need Help!',
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Have an issue or request? Contact our support team.',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(color: theme.disabledColor),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: theme.colorScheme.onPrimary, // Светлый фон
                  side: BorderSide(color: theme.dividerColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Contact Support',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textTheme.bodyMedium!.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
