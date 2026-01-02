import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class ViewControlActionBtn extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;
  final double iconSize;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const ViewControlActionBtn({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.textColor,
    this.iconSize = 12,
    this.fontSize = 11,
    this.borderRadius = 6,
    this.padding,
  });

  @override
  State<ViewControlActionBtn> createState() => _ViewControlActionBtnState();
}

class _ViewControlActionBtnState extends State<ViewControlActionBtn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final effectiveIconColor = widget.iconColor ?? theme.textSecondary;
    final effectiveTextColor = widget.textColor ?? theme.textPrimary;
    final effectivePadding =
        widget.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 16);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton.icon(
        onPressed: widget.onTap,
        icon: Icon(
          widget.icon,
          size: widget.iconSize,
          color: effectiveIconColor,
        ),
        label: Text(
          widget.label,
          style: AppTextStyles.label.copyWith(
            color: effectiveTextColor,
            fontSize: widget.fontSize,
          ),
        ),
        style: TextButton.styleFrom(
          padding: effectivePadding,
          minimumSize: const Size(0, 32),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          backgroundColor: _isHovered ? theme.gray100 : Colors.transparent,
          foregroundColor: effectiveTextColor,
          overlayColor: theme.gray100,
        ),
      ),
    );
  }
}
