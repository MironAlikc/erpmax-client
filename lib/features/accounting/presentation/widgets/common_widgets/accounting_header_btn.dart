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
  final Color? borderColor;
  final double height;
  final VoidCallback onTap;

  const AccountingHeaderBtn({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
    this.isOutline = false,
    this.iconColor,
    this.textColor,
    this.borderColor,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final Color contentColor =
        textColor ?? (isOutline ? theme.textPrimary : theme.white);

    return ElevatedButton(
      onPressed: onTap,
      style:
          ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: height, horizontal: 16),
            backgroundColor: isOutline
                ? theme.white
                : (color ?? theme.addButton),
            foregroundColor: contentColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: isOutline
                  ? BorderSide(
                      color: borderColor ?? theme.borderLight,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return isOutline
                    ? theme.gray50
                    : Colors.white.withValues(alpha: 0.1);
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
