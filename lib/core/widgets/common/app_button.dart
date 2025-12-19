import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:erpmax_client/core/design/app_design.dart';

enum AppButtonType { primary, primaryDark, success, danger, outline, ghost }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool isExpanded;
  final bool isIconRight;
  final bool isLoading;

  const AppButton({
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isExpanded = false,
    this.isIconRight = false,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = AppColorExtension.of(context);
    final (backgroundColor, foregroundColor) = _getColors(theme, appColors);

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: 48,
      child: ElevatedButton(
        onPressed: (isLoading || onPressed == null) ? null : onPressed,
        style:
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              disabledBackgroundColor: theme.disabledColor.withValues(
                alpha: 0.12,
              ),
              disabledForegroundColor: theme.disabledColor.withValues(
                alpha: 0.38,
              ),
              elevation: 0,
              side: type == AppButtonType.outline
                  ? BorderSide(color: theme.colorScheme.outline)
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return foregroundColor.withValues(alpha: 0.08);
                }
                return null;
              }),
            ),
        child: isLoading
            ? _buildLoadingIndicator(foregroundColor)
            : _buildContent(foregroundColor),
      ),
    );
  }

  Widget _buildContent(Color contentColor) {
    final content = [
      if (icon != null) Icon(icon, size: 20),
      if (icon != null) const SizedBox(width: 8),
      Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: isIconRight ? content.reversed.toList() : content,
    );
  }

  Widget _buildLoadingIndicator(Color color) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  (Color bg, Color fg) _getColors(
    ThemeData theme,
    AppColorExtension appColors,
  ) {
    if (onPressed == null) {
      return (theme.disabledColor.withValues(alpha: 0.12), theme.disabledColor);
    }

    return switch (type) {
      AppButtonType.primary => (theme.colorScheme.primary, Colors.white),
      AppButtonType.primaryDark => (appColors.primaryDark, Colors.white),
      AppButtonType.success => (appColors.success, Colors.white),
      AppButtonType.danger => (theme.colorScheme.error, Colors.white),
      AppButtonType.outline => (Colors.transparent, theme.colorScheme.primary),
      AppButtonType.ghost => (Colors.transparent, appColors.textSecondary),
    };
  }
}
