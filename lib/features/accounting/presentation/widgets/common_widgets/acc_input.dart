import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final double? width;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? height;
  final double fontSize;
  final bool? isIcon;

  const AccInput({
    super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.width = 120,
    this.keyboardType,
    this.maxLines = 1,
    this.height,
    this.isIcon = false,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: isIcon == true
          ? const EdgeInsets.symmetric(horizontal: 12)
          : EdgeInsets.zero,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
        color: theme.white,
      ),
      child: Row(
        children: [
          Visibility(
            visible: isIcon == true,
            child: Icon(
              LucideIcons.search,
              size: 18,
              color: theme.textSecondary,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: AppTextStyles.bodyMedium.copyWith(
                color: theme.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  fontSize: fontSize,
                  color: theme.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: height ?? 8,
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
