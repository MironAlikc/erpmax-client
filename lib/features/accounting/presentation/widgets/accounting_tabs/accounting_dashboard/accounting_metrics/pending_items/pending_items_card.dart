import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PendingItemsWidget extends StatelessWidget {
  const PendingItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
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
                localizations.accPendingItems,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textPrimary,
                ),
              ),
              Icon(LucideIcons.clock, color: theme.warning, size: 18),
            ],
          ),
          const SizedBox(height: 16),

          _buildItem(theme, localizations.accJournalsPendingReview, 3),
          const SizedBox(height: 8),
          _buildItem(theme, localizations.accBankReconciliationsPending, 2),
          const SizedBox(height: 8),
          _buildItem(theme, localizations.accInvoicesAwaitingApproval, 5),
        ],
      ),
    );
  }

  Widget _buildItem(AppColorExtension colors, String title, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.warning.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 13,
                color: colors.textPrimary,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: colors.white,
              border: Border.all(color: colors.warning),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$count',
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.warningText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
