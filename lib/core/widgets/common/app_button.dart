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
  final Color? backgroundColor;
  final Color? textColor;

  const AppButton({
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isExpanded = false,
    this.isIconRight = false,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = AppColorExtension.of(context);

    var (bg, fg) = _getColors(theme, appColors);
    if (backgroundColor != null) bg = backgroundColor!;
    if (textColor != null) fg = textColor!;

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: 44,
      child: ElevatedButton(
        onPressed: (isLoading || onPressed == null) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          side: type == AppButtonType.outline
              ? BorderSide(color: backgroundColor ?? theme.colorScheme.primary)
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
          ),
        ),
        child: isLoading ? _buildLoadingIndicator(fg) : _buildContent(fg),
      ),
    );
  }

  Widget _buildContent(Color contentColor) {
    final List<Widget> content = [
      if (icon != null) Icon(icon, size: 18),
      if (icon != null) const SizedBox(width: 8),
      Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
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
      height: 18,
      width: 18,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  (Color bg, Color fg) _getColors(
    ThemeData theme,
    AppColorExtension appColors,
  ) {
    if (onPressed == null)
      return (theme.disabledColor.withOpacity(0.12), theme.disabledColor);
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
