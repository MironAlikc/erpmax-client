import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
    final theme = context.theme.appColor;

    var (bg, fg) = _getColors(context);
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
              ? BorderSide(color: backgroundColor ?? theme.primary)
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.p8),
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

  (Color bg, Color fg) _getColors(BuildContext context) {
    final theme = context.theme.appColor;

    if (onPressed == null) {
      return (theme.bgDisabled, theme.textDisabled);
    }

    return switch (type) {
      AppButtonType.primary => (theme.primary, theme.white),
      AppButtonType.primaryDark => (theme.primaryDark, theme.white),
      AppButtonType.success => (theme.success, theme.white),
      AppButtonType.danger => (theme.error, theme.white),
      AppButtonType.outline => (Colors.transparent, theme.primary),
      AppButtonType.ghost => (Colors.transparent, theme.textSecondary),
    };
  }
}
