import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccountingHeaderBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isOutline;
  final Color? iconColor;
  final Color? textColor;

  const AccountingHeaderBtn({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    this.isOutline = false,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final Color contentColor =
        textColor ?? (isOutline ? theme.textPrimary : theme.white);

    return ElevatedButton(
      onPressed: () {},
      style:
          ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size.zero,
            padding: const EdgeInsets.all(16),
            backgroundColor: isOutline ? theme.white : (color ?? theme.black),
            foregroundColor: contentColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: isOutline
                  ? BorderSide(color: theme.borderLight, width: 1)
                  : BorderSide.none,
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return isOutline
                    ? theme.textPrimary.withValues(alpha: 0.04)
                    : theme.white.withValues(alpha: 0.1);
              }
              return null;
            }),
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor ?? contentColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.bodySmallBold.copyWith(
              height: 1.2,
              color: contentColor,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
