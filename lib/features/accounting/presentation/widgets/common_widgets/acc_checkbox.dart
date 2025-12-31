import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color? color;

  const AccCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 18.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? color ?? theme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value ? Colors.transparent : theme.primary,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: value
            ? Icon(LucideIcons.check, size: size - 6, color: theme.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}
