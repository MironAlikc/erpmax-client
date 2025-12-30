import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OverdueReceivablesCard extends StatelessWidget {
  const OverdueReceivablesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(
            theme,
            title: localizations.accOverdueReceivables,
            icon: LucideIcons.alertTriangle,
          ),
          const SizedBox(height: 12),
          _item(
            theme,
            company: 'Al-Amal Trading Co.',
            invoice: 'INV-2024-042',
            amount: '12 500',
            days: '45 days',
          ),
          _item(
            theme,
            company: 'Al-Noor Est.',
            invoice: 'INV-2024-058',
            amount: '8 200',
            days: '30 days',
          ),
          _item(
            theme,
            company: 'Modern Construction',
            invoice: 'INV-2024-071',
            amount: '25 000',
            days: '15 days',
          ),
        ],
      ),
    );
  }

  Widget _item(
    AppColorExtension colors, {
    required String company,
    required String invoice,
    required String amount,
    required String days,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.error.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors.error.withValues(alpha: 0.1),
          width: 0.6,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    fontSize: 13,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  invoice,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: colors.errorText,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                days,
                style: AppTextStyles.caption.copyWith(
                  color: colors.errorText,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration(AppColorExtension colors) {
  return BoxDecoration(
    color: colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: colors.shadowColor.withValues(alpha: 0.05),
        blurRadius: 10,
      ),
    ],
  );
}

Widget _header(
  AppColorExtension colors, {
  required String title,
  required IconData icon,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(color: colors.textPrimary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Icon(icon, color: colors.error, size: 18),
    ],
  );
}
