import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomSegmentedControl<T> extends StatelessWidget {
  final T selectedValue;
  final List<SegmentItem<T>> items;
  final ValueChanged<T> onValueChanged;
  final double width;

  const CustomSegmentedControl({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onValueChanged,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final backgroundColor = theme.gray50;

    return Container(
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: items.map((item) {
          final bool isActive = item.value == selectedValue;
          return _SegmentButton<T>(
            item: item,
            isActive: isActive,
            onTap: () => onValueChanged(item.value),
          );
        }).toList(),
      ),
    );
  }
}

class SegmentItem<T> {
  final T value;
  final String label;
  final IconData icon;

  SegmentItem({required this.value, required this.label, required this.icon});
}

class _SegmentButton<T> extends StatefulWidget {
  final SegmentItem<T> item;
  final bool isActive;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_SegmentButton<T>> createState() => _SegmentButtonState<T>();
}

class _SegmentButtonState<T> extends State<_SegmentButton<T>> {
  bool _isHovered = false;

  Color getBackgroundColor(AppColorExtension colors) {
    if (widget.isActive) return colors.white;
    if (_isHovered) return colors.gray100;
    return colors.gray50;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Expanded(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: getBackgroundColor(theme),
              borderRadius: BorderRadius.circular(6),
              boxShadow: widget.isActive
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.item.icon,
                  size: 16,
                  color: widget.isActive
                      ? theme.textPrimary
                      : theme.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.item.label,
                  style: AppTextStyles.tableHeader.copyWith(
                    color: widget.isActive
                        ? theme.textPrimary
                        : theme.textSecondary,
                    fontWeight: widget.isActive
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
