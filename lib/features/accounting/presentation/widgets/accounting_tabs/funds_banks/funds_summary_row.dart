import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/acc_formatters.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/color_icon_btn.dart';
import 'package:flutter/material.dart';

class FundsSummaryRow extends StatelessWidget {
  final String? filter;
  final List<FundBankData> data;

  const FundsSummaryRow({super.key, required this.filter, required this.data});

  static const double _minCardWidth = 220;
  static const double _spacing = 12;
  static const double _cardHeight = 50;

  double calculateTotalInTargetCurrency() {
    final targetCurrency = filter ?? 'SAR';
    final double targetRate = exchangeRates[targetCurrency] ?? 1.0;

    double grandTotal = 0;

    for (var account in data) {
      for (var detail in account.currencyDetails) {
        double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;

        double amountInTarget =
            (detail.amount / currentCurrencyRate) * targetRate;

        grandTotal += amountInTarget;
      }
    }
    return grandTotal;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final localizations = AppLocalizations.of(context);

        final width = constraints.maxWidth;
        final maxCardsPerRow = ((width + _spacing) / (_minCardWidth + _spacing))
            .floor();
        final crossAxisCount = maxCardsPerRow.clamp(1, 4);
        final totalBalance = calculateTotalInTargetCurrency();
        final label = filter ?? 'SAR';

        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: _spacing,
            crossAxisSpacing: _spacing,
            childAspectRatio: _minCardWidth / _cardHeight,
          ),
          children: [
            SummaryCard(
              title: localizations.totalBalanceWithLabel(label),
              value: totalBalance.toStringAsFixed(0),
              height: _cardHeight,
            ),
            SummaryCard(
              title: localizations.total_receipts,
              value: '+357320',
              height: _cardHeight,
            ),
            SummaryCard(
              title: localizations.total_payments,
              value: '-263261',
              height: _cardHeight,
            ),
            SummaryCard(
              title: localizations.todays_net_flow,
              value: '-263261',
              height: _cardHeight,
            ),
          ],
        );
      },
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final double height;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final Color statusColor = AccFormatters.getChangeColor(context, value);
    final String displayText = AccFormatters.formatChangeText(value);
    final IconData statusIcon = AccFormatters.getChangeIcon(value);

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ColorIconBtn(
            radius: 6.0,
            size: 24.0,
            iconSize: 14.0,
            colorIcon: statusColor,
            color: statusColor.withValues(alpha: 0.08),
            icon: statusIcon,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    displayText,
                    style: AppTextStyles.h4.copyWith(
                      color: statusColor,
                      height: 1.0,
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: AppTextStyles.caption.copyWith(
                      color: theme.textSecondary,
                      height: 1.0,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
