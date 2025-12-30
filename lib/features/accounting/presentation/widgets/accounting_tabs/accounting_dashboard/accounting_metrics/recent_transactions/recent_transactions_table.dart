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
    if (amount.startsWith('+')) return theme.success;
    if (amount.startsWith('-')) return theme.error;
    return theme.textPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
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
          _buildTopHeader(theme, localizations),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              return Material(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Table(
                      // Оставляем границы
                      border: TableBorder(
                        horizontalInside: BorderSide(color: theme.borderLight),
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
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader(
    AppColorExtension theme,
    AppLocalizations localizations,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            localizations.recentTransactions,
            style: AppTextStyles.bodyMediumBold.copyWith(
              color: theme.textPrimary,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              localizations.viewAll,
              style: AppTextStyles.caption.copyWith(color: theme.textSecondary),
            ),
          ),
        ],
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
        _buildCell(
          theme,
          child: Text(
            ref,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
          ),
        ),
        _buildCell(
          theme,
          child: Text(
            date,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
          ),
        ),
        _buildCell(
          theme,
          child: Text(
            desc,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
          ),
        ),
        _buildCell(
          theme,
          alignEnd: true,
          child: Text(
            amount,
            style: AppTextStyles.bodyMediumBold.copyWith(color: amountColor),
          ),
        ),
        _buildCell(
          theme,
          child: Row(
            children: [
              const SizedBox(width: 4),
              SizedBox(
                width: 20,
                child: Center(
                  child: Icon(
                    status.icon,
                    size: 14,
                    color: status.getColor(theme),
                  ),
                ),
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
      ],
    );
  }

  Widget _buildCell(
    AppColorExtension theme, {
    required Widget child,
    bool alignEnd = false,
  }) {
    return TableRowInkWell(
      onTap: () {},
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.hovered)
            ? theme.textPrimary.withValues(alpha: 0.04)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Align(
          alignment: alignEnd ? Alignment.centerRight : Alignment.centerLeft,
          child: child,
        ),
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
}
