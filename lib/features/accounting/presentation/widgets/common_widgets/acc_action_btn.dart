import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccActionBtn extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback? onTap;
  final bool isLoading;

  const AccActionBtn({
    super.key,
    required this.icon,
    this.label,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isEnabled = onTap != null && !isLoading;
    final bool hasLabel = label != null && label!.isNotEmpty;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      hoverColor: theme.gray100,
      splashColor: theme.gray100,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: hasLabel ? 16 : 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isEnabled
                ? theme.border
                : theme.border.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(8),
          color: isEnabled
              ? Colors.transparent
              : theme.gray50.withValues(alpha: 0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(
                icon,
                size: 16,
                color: isEnabled ? theme.textPrimary : theme.textSecondary,
              ),
            if (hasLabel) ...[
              const SizedBox(width: 8),
              Text(
                label!,
                style: AppTextStyles.tableHeader.copyWith(
                  color: isEnabled ? theme.textPrimary : theme.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
