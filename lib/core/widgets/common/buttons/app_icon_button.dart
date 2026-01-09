import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double iconSize;
  final double padding;
  final Color? hoverColor;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.iconSize = 20.0,
    this.padding = 8.0,
    this.hoverColor,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final effectiveIconColor = iconColor ?? theme.textTertiary;
    final effectiveHoverColor = hoverColor ?? theme.white;

    return Tooltip(
      message: tooltip ?? '',
      waitDuration: tooltip == null
          ? Duration.zero
          : const Duration(milliseconds: 500),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          hoverColor: effectiveHoverColor,
          borderRadius: BorderRadius.circular(6),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Icon(icon, size: iconSize, color: effectiveIconColor),
          ),
        ),
      ),
    );
  }
}
