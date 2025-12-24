import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ErpMaxTabItem {
  final String name;
  final IconData icon;
  const ErpMaxTabItem({required this.name, required this.icon});
}

class ErpMaxTabFilter extends StatelessWidget {
  final List<ErpMaxTabItem> items;
  final String selectedItem;
  final Function(String) onSelected;

  const ErpMaxTabFilter({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.textDisabled.withValues(alpha: 0.1)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            final bool isSelected = selectedItem == item.name;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(item.name),
                avatar: Icon(
                  item.icon,
                  size: 16,
                  color: isSelected ? theme.white : theme.textSecondary,
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  if (selected) onSelected(item.name);
                },
                selectedColor: theme.primaryDark,
                backgroundColor: Colors.transparent,
                labelStyle: TextStyle(
                  color: isSelected ? theme.white : theme.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide.none,
                showCheckmark: false,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
