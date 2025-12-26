import 'package:erpmax_client/core/config/menu_data.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/menu_item_model.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

import 'sidebar_menu_item.dart';

class SidebarMenu extends StatelessWidget {
  final bool isExpanded;
  final int selectedIndex;
  final Function(int) onSelect;

  const SidebarMenu({
    super.key,
    required this.isExpanded,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final allItems = MenuData.getAllMenuItems();

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: isExpanded ? 8 : 16),
        children: [
          _buildSection(
            context,
            localizations.menuAccounting,
            MenuData.coreModules,
            allItems,
          ),
          _buildSection(
            context,
            localizations.business,
            MenuData.businessManagement,
            allItems,
          ),
          _buildSection(
            context,
            localizations.system,
            MenuData.systemTools,
            allItems,
          ),
          _buildSection(
            context,
            localizations.menuSettings,
            MenuData.settings,
            allItems,
          ),
          if (isExpanded) _buildHelpSection(context),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<MenuItemModel> items,
    List<MenuItemModel> allItems,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey.shade500,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ...items.map((item) {
          final index = allItems.indexOf(item);
          final bool isChildSelected =
              item.children?.any((c) => allItems.indexOf(c) == selectedIndex) ??
              false;
          final bool isSelected = index == selectedIndex || isChildSelected;

          return Column(
            children: [
              SidebarMenuItem(
                item: item,
                isSelected: isSelected,
                isExpanded: isExpanded,
                onTap: () => onSelect(index),
              ),
              if (isExpanded && isSelected && item.children != null)
                ...item.children!.map((child) {
                  final cIndex = allItems.indexOf(child);
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SidebarMenuItem(
                      item: child,
                      isSelected: cIndex == selectedIndex,
                      isExpanded: true,
                      onTap: () => onSelect(cIndex),
                    ),
                  );
                }),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildHelpSection(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.appColor.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
      ),
      child: Column(
        children: [
          const Icon(Icons.help_center_outlined, color: Colors.blue),
          const SizedBox(height: 8),
          Text(localizations.supportCenter, style: AppTextStyles.bodySmallBold),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              localizations.getHelp,
              style: AppTextStyles.tableHeader,
            ),
          ),
        ],
      ),
    );
  }
}
