import 'package:erpmax_client/core/models/menu_item_model.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class SidebarMenuItem extends StatelessWidget {
  final MenuItemModel item;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final Color bgColor = isSelected
        ? theme.sidebarActiveBg
        : Colors.transparent;
    final Color contentColor = isSelected
        ? theme.sidebarActiveText
        : theme.sidebarInactiveText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isExpanded ? 12 : 8,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 20, color: contentColor),
              if (isExpanded) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    style: AppTextStyles.base.copyWith(
                      color: contentColor,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
