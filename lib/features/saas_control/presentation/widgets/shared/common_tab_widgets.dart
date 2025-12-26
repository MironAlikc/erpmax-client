import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class TabHeaderTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final String tenantName;

  const TabHeaderTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.tenantName = "StartUp Inc",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 24, color: context.theme.appColor.textPrimary),
              const SizedBox(width: 12),
            ],
            Text(title, style: AppTextStyles.h1.copyWith(fontSize: 24)),
            const SizedBox(width: 12),
            _TenantBadge(text: tenantName),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(
            color: const Color(0xFF667085),
          ),
        ),
      ],
    );
  }
}

class _TenantBadge extends StatelessWidget {
  final String text;
  const _TenantBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.borderLight,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: theme.border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
