import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GeneralLedgerHeader extends StatelessWidget {
  final String title;

  const GeneralLedgerHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              LucideIcons.bookOpen,
              color: theme.sidebarActiveIcon,
              size: 24,
            ),
            const SizedBox(width: 12),

            Text(
              title,
              style: AppTextStyles.h1.copyWith(
                color: theme.textPrimary,
                fontSize: 26,
              ),
            ),
          ],
        ),

        const SizedBox(width: 16),

        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AccountingHeaderBtn(
                  label: localizations.accReceipts,
                  icon: LucideIcons.arrowDownLeft,
                  isOutline: true,
                  iconColor: theme.successText,
                ),
                const SizedBox(width: 12),
                AccountingHeaderBtn(
                  label: localizations.accPayments,
                  icon: LucideIcons.arrowUpRight,
                  isOutline: true,
                  iconColor: theme.errorText,
                ),
                const SizedBox(width: 12),
                AccountingHeaderBtn(
                  label: localizations.accCashJournal,
                  icon: LucideIcons.wallet,
                  isOutline: true,
                  iconColor: theme.violetText,
                ),
                const SizedBox(width: 12),
                AccountingHeaderBtn(
                  label: localizations.transfer,
                  icon: LucideIcons.arrowLeftRight,
                  isOutline: true,
                  iconColor: theme.successText,
                ),
                const SizedBox(width: 12),
                AccountingHeaderBtn(
                  label: localizations.accExchange,
                  icon: LucideIcons.refreshCcw,
                  isOutline: true,
                  iconColor: theme.warningText,
                ),
                const SizedBox(width: 12),
                AccountingHeaderBtn(
                  label: localizations.accJournalEntry,
                  icon: LucideIcons.plus,
                  color: theme.sidebarActiveIcon,
                  iconColor: theme.white,
                  textColor: theme.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
