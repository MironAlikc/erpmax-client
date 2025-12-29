import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EmptyStatePlaceholder extends StatelessWidget {
  final String message;
  final IconData icon;
  final Widget? action;

  const EmptyStatePlaceholder({
    super.key,
    required this.message,
    this.icon = LucideIcons.alertCircle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.border,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: theme.textSecondary),
            ),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLarge.copyWith(
                color: theme.textSecondary,
              ),
            ),
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}
