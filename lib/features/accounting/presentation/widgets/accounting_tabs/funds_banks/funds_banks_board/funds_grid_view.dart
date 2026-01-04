import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools.dart';
import 'package:flutter/material.dart';

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

        if (width >= 1200) {
          crossAxisCount = 4;
          cardWidth = (width - (3 * 16)) / 4;
        } else if (width >= 900) {
          crossAxisCount = 3;
          cardWidth = (width - (2 * 16)) / 3;
        } else if (width >= 600) {
          crossAxisCount = 2;
          cardWidth = (width - 16) / 2;
        } else {
          crossAxisCount = 1;
          cardWidth = width;
        }

        const cardHeight = 280.0;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: cardWidth / cardHeight,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildGridCard(data[index]);
          },
        );
      },
    );
  }

  Widget _buildGridCard(FundBankData account) {
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
      height: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: account.type == 'Cash'
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  account.type == 'Cash'
                      ? Icons.attach_money
                      : Icons.account_balance,
                  color: account.type == 'Cash'
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFF2196F3),
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            account.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          if (account.accountNumber != null) ...[
            const SizedBox(height: 4),
            Text(
              account.accountNumber!,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ] else ...[
            const SizedBox(height: 4),
            Text(
              'Cash Fund',
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
          const Spacer(),
          Row(
            children: [
              Text(displayFlag, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              Text(
                displayCurrency,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              const Spacer(),
              if (activeFilter != null &&
                  !account.currencyDetails.any(
                    (d) => d.currency == activeFilter,
                  ))
                _buildConvertedBadge(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formatNum(displayAmount),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: account.currencyDetails.map((detail) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(detail.flag, style: const TextStyle(fontSize: 10)),
                        const SizedBox(width: 2),
                        Text(
                          '${detail.amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} ${detail.currency}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    account.todayChange >= 0
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: account.todayChange >= 0
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFFF44336),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    account.todayChange > 0
                        ? '+${account.todayChange}'
                        : account.todayChange.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: account.todayChange >= 0
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFF44336),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                account.lastActivity,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConvertedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'conv',
        style: TextStyle(
          fontSize: 9,
          color: Color(0xFFFF9800),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
