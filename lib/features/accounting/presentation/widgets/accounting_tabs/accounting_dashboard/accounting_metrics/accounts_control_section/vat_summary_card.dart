import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class VatSummaryCard extends StatelessWidget {
  const VatSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final String formattedDate = DateFormat.yMd(
      Localizations.localeOf(context).toString(),
    ).format(DateTime(2024, 4, 15));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(
            theme,
            title: localizations.accVatSummary,
            icon: LucideIcons.scrollText,
          ),
          Spacer(),
          _row(
            theme,
            localizations.accVatCollectedLabel,
            '+15 200',
            theme.successText,
          ),
          _row(theme, localizations.accVatPaidLabel, '-8 500', theme.errorText),
          Divider(color: theme.borderLight),
          _row(
            theme,
            localizations.accVatNetLabel,
            '6 700',
            theme.black,
            isSum: true,
          ),
          const SizedBox(height: 8),
          Text(
            localizations.accVatDueLabel(formattedDate),
            style: AppTextStyles.bodySmall.copyWith(color: theme.warning),
          ),
        ],
      ),
    );
  }

  Widget _row(
    AppColorExtension colors,
    String label,
    String value,
    Color color, {
    bool isSum = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: isSum
                  ? AppTextStyles.bodyMediumBold.copyWith(
                      fontSize: 13,
                      color: colors.black,
                    )
                  : AppTextStyles.bodyMedium.copyWith(
                      fontSize: 13,
                      color: colors.textPrimary,
                    ),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: color,
              fontSize: isSum ? 16 : AppTextStyles.bodySmallBold.fontSize,
            ),
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
      Icon(icon, color: colors.indigoText, size: 20),
    ],
  );
}
