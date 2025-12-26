import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;

  const SectionHeader({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: theme.primary, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          title,
          style: AppTextStyles.h2.copyWith(
            color: theme.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
