import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools.dart';
import 'package:flutter/material.dart';

class FundsSummaryRow extends StatelessWidget {
  final String? filter;
  final List<FundBankData> data;

  const FundsSummaryRow({super.key, required this.filter, required this.data});

  static const double _minCardWidth = 220;
  static const double _spacing = 12;
  static const double _cardHeight = 90;

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
              title: 'Total Balance ($label)',
              value: totalBalance.toStringAsFixed(0),
              color: Colors.blue,
              height: 90,
            ),
            SummaryCard(
              title: 'Total Receipts',
              value: '+357 320',
              color: Colors.green,
              height: _cardHeight,
            ),
            SummaryCard(
              title: 'Total Payments',
              value: '-263 261',
              color: Colors.red,
              height: _cardHeight,
            ),
            SummaryCard(
              title: 'Total Payments',
              value: '-263 261',
              color: Colors.green.shade700,
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
  final Color color;
  final double height;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
