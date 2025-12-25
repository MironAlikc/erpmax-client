import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AppPlaceholder extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const AppPlaceholder({
    super.key,
    required this.title,
    this.subtitle,
    this.icon = Icons.analytics_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final placeholderSubtitle = subtitle ?? localizations.defaultSubtitle;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: theme.gray300.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.bgLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 48,
              color: theme.textDisabled.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            placeholderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
