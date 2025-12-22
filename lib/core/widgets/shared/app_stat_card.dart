import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:erpmax_client/core/design/app_design.dart';

// lib/core/widgets/common/app_stat_card.dart

class AppAppStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final Color? color;
  final IconData? icon;

  const AppAppStatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);
    final theme = Theme.of(context);
    final accent = color ?? colors.primaryDark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: accent.withOpacity(0.1), width: 2),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              if (icon != null)
                Icon(icon, size: 20, color: accent.withOpacity(0.5)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: colors.textPrimary,
              fontSize: 24,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
