import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class RecentTransactionsTable extends StatelessWidget {
  const RecentTransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Transactions",
            style: AppTextStyles.h2.copyWith(
              color: theme.textPrimary,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Latest financial activities and journal entries.",
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2.5),
              3: FlexColumnWidth(1.2),
              4: FlexColumnWidth(0.8),
            },
            children: [
              _header(theme, localizations),
              _row(
                context,
                "JV-2024-001",
                "2024-03-20",
                "Office Rent Payment",
                "-\$5,000",
                "Posted",
                theme.error,
              ),
              _row(
                context,
                "JV-2024-002",
                "2024-03-19",
                "Client Invoice #INV-001",
                "+\$12,500",
                "Posted",
                theme.success,
              ),
              _row(
                context,
                "JV-2024-003",
                "2024-03-18",
                "Office Supplies",
                "-\$450",
                "Draft",
                theme.warning,
              ),
              _row(
                context,
                "JV-2024-004",
                "2024-03-18",
                "Consulting Services",
                "+\$3,000",
                "Posted",
                theme.success,
              ),
              _row(
                context,
                "JV-2024-005",
                "2024-03-17",
                "Internet Bill",
                "-\$120",
                "Posted",
                theme.error,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _header(AppColorExtension theme, AppLocalizations l10n) => TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: theme.borderLight)),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(l10n.reference, style: headStl(theme)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(l10n.date, style: headStl(theme)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(l10n.description, style: headStl(theme)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(l10n.amount, style: headStl(theme)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(l10n.status, style: headStl(theme)),
      ),
    ],
  );

  TextStyle headStl(AppColorExtension theme) =>
      AppTextStyles.bodySmall.copyWith(
        color: theme.textSecondary,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      );

  TableRow _row(
    BuildContext context,
    String ref,
    String date,
    String desc,
    String amt,
    String status,
    Color amtCol,
  ) {
    final theme = context.theme.appColor;
    final bool isPosted = status == "Posted";

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),

          child: Text(
            ref,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.textPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            date,
            style: AppTextStyles.bodySmall.copyWith(color: theme.textSecondary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            desc,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.textPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            amt,
            style: AppTextStyles.bodyMedium.copyWith(
              color: amtCol,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isPosted
                  ? theme.success.withValues(alpha: 0.1)
                  : theme.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isPosted ? theme.success : theme.warning,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
