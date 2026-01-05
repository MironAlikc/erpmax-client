import 'package:erpmax_client/core/constants/breakpoints.dart';
import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FundGridView extends StatelessWidget {
  final List<FundBankData> data;
  final String? activeFilter;

  const FundGridView({
    super.key,
    required this.data,
    required this.activeFilter,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount;
        double cardWidth;

        if (width >= Breakpoint.desktopBreakpoint) {
          crossAxisCount = 4;
          cardWidth = (width - (3 * 16)) / 4;
        } else if (width >= Breakpoint.mobileBreakpoint) {
          crossAxisCount = 3;
          cardWidth = (width - (2 * 16)) / 3;
        } else if (width >= Breakpoint.mobileBreakpoint) {
          crossAxisCount = 2;
          cardWidth = (width - 16) / 2;
        } else {
          crossAxisCount = 1;
          cardWidth = width;
        }

        const cardHeight = 220.00;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: cardWidth / cardHeight,
            crossAxisSpacing: Dimens.p16,
            mainAxisSpacing: Dimens.p16,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildGridCard(context, data[index]);
          },
        );
      },
    );
  }

  Widget _buildGridCard(BuildContext context, FundBankData account) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final String displayCurrency = activeFilter ?? 'SAR';
    final String displayFlag = getFlagFor(displayCurrency);
    final double targetRate = exchangeRates[displayCurrency] ?? 1.0;

    double displayAmount = 0;

    for (var detail in account.currencyDetails) {
      double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;

      displayAmount += (detail.amount / currentCurrencyRate) * targetRate;
    }

    if (displayAmount == 0 && account.balance > 0) {
      double baseRate = exchangeRates[account.currency] ?? 1.0;
      displayAmount = (account.balance / baseRate) * targetRate;
    }

    return Container(
      padding: const EdgeInsets.all(Dimens.p16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(Dimens.p12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimens.p6),
                decoration: BoxDecoration(
                  color: account.type == 'Cash'
                      ? theme.successText.withValues(alpha: 0.08)
                      : theme.infoText.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  account.type == 'Cash'
                      ? LucideIcons.wallet
                      : LucideIcons.landmark,
                  color: account.type == 'Cash'
                      ? theme.successText
                      : theme.infoText,
                  size: 16,
                ),
              ),
            ],
          ),
          gapH8,
          Text(
            account.name,
            style: AppTextStyles.tableHeader.copyWith(color: theme.textPrimary),
          ),
          if (account.accountNumber != null) ...[
            gapH4,
            Text(
              account.accountNumber!,
              style: AppTextStyles.caption.copyWith(color: theme.textSecondary),
            ),
          ] else ...[
            gapH4,
            Text(
              localizations.labelCashFund,
              style: AppTextStyles.caption.copyWith(color: theme.textSecondary),
            ),
          ],
          gapH20,
          Row(
            children: [
              Text(displayFlag, style: AppTextStyles.label),
              const SizedBox(width: 4),
              Text(
                displayCurrency,
                style: AppTextStyles.caption.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              const Spacer(),
              if (activeFilter != null &&
                  account.currencyDetails.any(
                    (d) => d.currency == activeFilter,
                  ))
                _buildConvertedBadge(context),
            ],
          ),
          gapH8,
          Text(
            formatNum(displayAmount),
            style: AppTextStyles.h4.copyWith(
              color: theme.textPrimary,
              height: 1.0,
            ),
          ),
          const Spacer(),
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: Dimens.p6,
                runSpacing: Dimens.p4,
                children: account.currencyDetails.map((detail) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.p6,
                      vertical: Dimens.p3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.border,
                      borderRadius: BorderRadius.circular(Dimens.p4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          detail.flag,
                          style: AppTextStyles.overline.copyWith(
                            height: 1.0,
                            fontSize: 10,
                          ),
                        ),
                        gapW2,
                        Text(
                          formatNum(detail.amount),
                          style: AppTextStyles.caption.copyWith(
                            color: theme.textTertiary,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          gapH8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    account.todayChange >= 0
                        ? LucideIcons.trendingUp
                        : LucideIcons.trendingDown,
                    color: account.todayChange >= 0
                        ? theme.successText
                        : theme.errorText,
                    size: 14,
                  ),
                  gapW4,
                  Text(
                    account.todayChange > 0
                        ? '+${account.todayChange}'
                        : account.todayChange.toString(),
                    style: AppTextStyles.label.copyWith(
                      color: account.todayChange >= 0
                          ? theme.successText
                          : theme.errorText,
                    ),
                  ),
                ],
              ),
              Text(
                account.lastActivity,
                style: AppTextStyles.caption.copyWith(
                  color: theme.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConvertedBadge(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p6,
        vertical: Dimens.p2,
      ),
      decoration: BoxDecoration(
        color: theme.warningBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        AppLocalizations.of(context).labelConv,
        style: AppTextStyles.overline.copyWith(
          fontSize: 9,
          color: theme.warningText,
        ),
      ),
    );
  }
}
