import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final double? width;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? height;

  const AccInput({
    super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.width = 120,
    this.keyboardType,
    this.maxLines = 1,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
        color: theme.white,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: AppTextStyles.bodyMedium.copyWith(color: theme.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
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
    );
  }
}
