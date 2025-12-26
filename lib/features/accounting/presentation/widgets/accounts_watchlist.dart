import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccountsWatchlist extends StatelessWidget {
  const AccountsWatchlist({super.key});

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
          Text(localizations.accountsWatchlist, style: AppTextStyles.h3),
          const SizedBox(height: 20),
          _item(
            context,
            localizations.accountCashOnHand,
            "1110 - Current Assets",
            "\$12,450",
          ),
          _divider(theme),
          _item(
            context,
            localizations.accountBankAlBilad,
            "1120 - Bank Accounts",
            "\$85,200",
          ),
          _divider(theme),
          _item(
            context,
            localizations.accountReceivable,
            "1130 - Current Assets",
            "\$45,100",
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, String sub, String val) {
    final theme = context.theme.appColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: theme.textPrimary,
              ),
            ),
            Text(
              sub,
              style: AppTextStyles.tableHeader.copyWith(
                color: theme.textDisabled,
              ),
            ),
          ],
        ),
        Text(
          val,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _divider(AppColorExtension theme) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Divider(color: theme.borderLight, height: 1),
  );
}
