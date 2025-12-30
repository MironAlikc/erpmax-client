import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum TransactionStatus {
  posted,
  draft;

  Color getColor(AppColorExtension theme) {
    switch (this) {
      case TransactionStatus.posted:
        return theme.success;
      case TransactionStatus.draft:
        return theme.warning;
    }
  }

  String getLabel(AppLocalizations localizations) {
    switch (this) {
      case TransactionStatus.posted:
        return localizations.statusPosted;
      case TransactionStatus.draft:
        return localizations.statusDraft;
    }
  }

  // double get iconSize {
  //   switch (this) {
  //     case TransactionStatus.posted:
  //       return 14;
  //     case TransactionStatus.draft:
  //       return 10;
  //   }
  // }

  IconData? get icon =>
      this == TransactionStatus.posted ? LucideIcons.check : LucideIcons.circle;
}

class RecentTransactionsTable extends StatelessWidget {
  const RecentTransactionsTable({super.key});

  Color _getAmountColor(String amount, AppColorExtension theme) {
    if (amount.startsWith('+')) {
      return theme.success;
    } else if (amount.startsWith('-')) {
      return theme.error;
    }
    return theme.textPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 16),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.recentTransactions,
                  style: AppTextStyles.h4.copyWith(color: theme.textPrimary),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    localizations.viewAll,
                    style: AppTextStyles.caption.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(color: theme.borderLight),
                      verticalInside: BorderSide(color: theme.borderLight),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(2.5),
                      3: FlexColumnWidth(1.4),
                      4: FlexColumnWidth(1.4),
                    },
                    children: [
                      _header(theme, localizations),
                      _row(
                        context,
                        ref: "JV-2024-001",
                        date: "2024-03-20",
                        desc: "Office Rent Payment",
                        amount: "-5 000",
                        status: TransactionStatus.posted,
                      ),
                      _row(
                        context,
                        ref: "JV-2024-002",
                        date: "2024-03-19",
                        desc: "Client Invoice #INV-001",
                        amount: "+12 500",
                        status: TransactionStatus.posted,
                      ),
                      _row(
                        context,
                        ref: "JV-2024-003",
                        date: "2024-03-18",
                        desc: "Office Supplies",
                        amount: "-450",
                        status: TransactionStatus.draft,
                      ),
                      _row(
                        context,
                        ref: "JV-2024-004",
                        date: "2024-03-18",
                        desc: "Consulting Services",
                        amount: "+3 000",
                        status: TransactionStatus.posted,
                      ),
                      _row(
                        context,
                        ref: "JV-2024-005",
                        date: "2024-03-17",
                        desc: "Internet Bill",
                        amount: "-120",
                        status: TransactionStatus.posted,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  TableRow _header(AppColorExtension theme, AppLocalizations l10n) {
    return TableRow(
      decoration: BoxDecoration(color: theme.error.withValues(alpha: 0.05)),
      children: [
        _headerCell(l10n.reference, theme),
        _headerCell(l10n.date, theme),
        _headerCell(l10n.description, theme),
        _headerCell(l10n.amount, theme, alignEnd: true),
        _headerCell(l10n.status, theme),
      ],
    );
  }

  Widget _headerCell(
    String text,
    AppColorExtension theme, {
    bool alignEnd = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        text,
        textAlign: alignEnd ? TextAlign.right : TextAlign.left,
        style: AppTextStyles.bodySmallBold.copyWith(color: theme.textSecondary),
      ),
    );
  }

  TableRow _row(
    BuildContext context, {
    required String ref,
    required String date,
    required String desc,
    required String amount,
    required TransactionStatus status,
  }) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final Color amountColor = _getAmountColor(amount, theme);

    return TableRow(
      children: [
        _cell(
          ref,
          theme,
          style: AppTextStyles.bodyMedium.copyWith(
            color: theme.textPrimary,
            fontSize: 13,
          ),
        ),
        _cell(
          date,
          theme,
          style: AppTextStyles.bodyMedium.copyWith(
            color: theme.textPrimary,
            fontSize: 13,
          ),
        ),
        _cell(
          desc,
          theme,
          style: AppTextStyles.bodyMedium.copyWith(
            color: theme.textPrimary,
            fontSize: 13,
          ),
        ),
        _cell(
          amount,
          theme,
          alignEnd: true,
          style: AppTextStyles.bodyMediumBold.copyWith(color: amountColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 16),
                SizedBox(
                  width: 20,
                  child: status.icon != null
                      ? Center(
                          child: Icon(
                            status.icon,
                            size: 14,
                            // size: status.iconSize,
                            color: status.getColor(theme),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(width: 4),
                Text(
                  status.getLabel(localizations),
                  style: AppTextStyles.caption.copyWith(
                    color: status.getColor(theme),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _cell(
    String text,
    AppColorExtension theme, {
    TextStyle? style,
    bool alignEnd = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(
        text,
        textAlign: alignEnd ? TextAlign.right : TextAlign.left,
        style: style,
      ),
    );
  }
}
