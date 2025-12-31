import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccountingHeader extends StatelessWidget {
  final String title;

  const AccountingHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Wrap(
      spacing: 20,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.h3.copyWith(color: theme.textPrimary)),

        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AccountingHeaderBtn(
                      label: localizations.accCustomize,
                      icon: LucideIcons.slidersHorizontal,
                      isOutline: true,
                      iconColor: theme.textSecondary,
                    ),
                    const SizedBox(width: 12),
                    AccountingHeaderBtn(
                      label: localizations.accReceipts,
                      icon: LucideIcons.arrowDownRight,
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
            );
          },
        ),
      ],
    );
  }
}
