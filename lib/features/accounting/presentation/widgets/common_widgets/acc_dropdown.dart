import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final String Function(T) itemLabelBuilder;
  final IconData leadingIcon;
  final ValueChanged<T> onChanged;
  final String? tooltipMessage;

  const AccDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.itemLabelBuilder,
    required this.leadingIcon,
    required this.onChanged,
    this.tooltipMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: theme.textPrimary.withValues(alpha: 0.08),
        hoverColor: theme.textPrimary.withValues(alpha: 0.04),
      ),
      child: PopupMenuButton<T>(
        initialValue: value,
        onSelected: onChanged,
        menuPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        offset: const Offset(0, 45),
        color: theme.white,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        itemBuilder: (context) => items.map((T item) {
          return _buildMenuItem(theme, item, item == value);
        }).toList(),
        child: Tooltip(
          message: tooltipMessage ?? 'Menu',
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: theme.border),
              borderRadius: BorderRadius.circular(8),
              color: theme.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(leadingIcon, size: 16, color: theme.textSecondary),
                const SizedBox(width: 8),
                Text(
                  itemLabelBuilder(value),
                  style: AppTextStyles.label.copyWith(color: theme.textPrimary),
                ),
                const SizedBox(width: 4),
                Icon(
                  LucideIcons.chevronsUpDown,
                  size: 12,
                  color: theme.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem<T> _buildMenuItem(
    AppColorExtension colors,
    T item,
    bool isSelected,
  ) {
    return PopupMenuItem<T>(
      value: item,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemLabelBuilder(item),
            style: AppTextStyles.label.copyWith(
              color: isSelected ? colors.textPrimary : colors.textSecondary,
            ),
          ),
          if (isSelected)
            Icon(LucideIcons.check, size: 14, color: colors.textPrimary),
        ],
      ),
    );
  }
}
