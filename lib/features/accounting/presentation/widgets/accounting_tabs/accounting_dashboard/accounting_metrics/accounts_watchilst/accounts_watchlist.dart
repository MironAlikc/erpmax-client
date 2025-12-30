import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccountsWatchlist extends StatelessWidget {
  const AccountsWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: theme.borderLight),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.accountsWatchlist,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: theme.textPrimary,
                  ),
                ),
                Icon(
                  LucideIcons.moreHorizontal,
                  color: theme.textSecondary,
                  size: 18,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.borderLight),

          _item(
            context,
            title: localizations.accountCashOnHand,
            code: '1110',
            amount: '12 450',
            type: 'Dr',
          ),

          _item(
            context,
            title: localizations.accountBankAlBilad,
            code: '1120',
            amount: '85 200',
            type: 'Dr',
          ),

          _item(
            context,
            title: localizations.accountReceivable,
            code: '1130',
            amount: '45 100',
            type: 'Dr',
            highlight: true,
          ),

          _item(
            context,
            title: localizations.accAccountsPayable,
            code: '2110',
            amount: '28 300',
            type: 'Cr',
          ),

          Divider(height: 1, color: theme.borderLight),

          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.plus, size: 16, color: theme.textSecondary),
                  const SizedBox(width: 6),
                  Text(
                    localizations.accAddAccount,
                    style: AppTextStyles.caption.copyWith(
                      color: theme.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required String code,
    required String amount,
    required String type,
    bool highlight = false,
  }) {
    final theme = context.theme.appColor;

    final amountColor = highlight ? theme.warning : theme.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(LucideIcons.wallet, size: 16, color: theme.textDisabled),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: theme.textPrimary,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  code,
                  style: AppTextStyles.caption.copyWith(
                    color: theme.textDisabled,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$ $amount',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                type,
                style: AppTextStyles.caption.copyWith(
                  color: theme.textDisabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
