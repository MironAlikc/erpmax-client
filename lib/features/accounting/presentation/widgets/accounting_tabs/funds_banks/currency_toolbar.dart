import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools.dart';
import 'package:flutter/material.dart';

class CurrencyToolbar extends StatelessWidget {
  final String? selected;

  final List<CurrencyModel> currencies;
  final List<FundBankData> allAccounts;

  final ValueChanged<String?> onChanged;

  const CurrencyToolbar({
    super.key,
    required this.selected,
    required this.currencies,
    required this.allAccounts,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1000;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: isWide ? _wideLayout() : _narrowLayout(),
        );
      },
    );
  }

  Widget _wideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [_filters(), _fundButton()],
          ),
        ),
        const SizedBox(width: 12),
        Align(
          alignment: Alignment.centerRight,
          child: _Balances(
            allAccounts: allAccounts,
            onChanged: onChanged,
            selectedCurrency: selected,
          ),
        ),
      ],
    );
  }

  Widget _narrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(spacing: 8, runSpacing: 8, children: [_filters(), _fundButton()]),
        const SizedBox(height: 12),
        _Balances(
          allAccounts: allAccounts,
          onChanged: onChanged,
          selectedCurrency: selected,
        ),
      ],
    );
  }

  Widget _filters() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _chip('All', null),

        ...currencies.map((c) => _chip(c.currency, c.currency, c.flag)),
      ],
    );
  }

  Widget _chip(String label, String? value, [String? flag]) {
    final active = selected == value;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFEFF3F8) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: active
                ? const Color(0xFF007AFF).withOpacity(0.2)
                : const Color(0xFFE3E6EB),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (flag != null) ...[
              Text(flag, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: active ? const Color(0xFF007AFF) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fundButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, size: 18),
      label: const Text('Fund/Bank'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0B2C44),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _Balances extends StatelessWidget {
  final List<FundBankData> allAccounts;
  final ValueChanged<String?> onChanged;
  final String? selectedCurrency;

  const _Balances({
    required this.allAccounts,
    required this.onChanged,
    this.selectedCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, double> totals = {};
    final Map<String, String> flags = {};

    for (var acc in allAccounts) {
      for (var detail in acc.currencyDetails) {
        totals[detail.currency] =
            (totals[detail.currency] ?? 0) + detail.amount;
        flags[detail.currency] = detail.flag;
      }
    }

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: totals.entries.map((entry) {
        final currencyCode = entry.key;

        final bool isThisActive = selectedCurrency == currencyCode;

        return GestureDetector(
          onTap: () => onChanged(currencyCode),
          child: BalanceCard(
            currency: currencyCode,
            flag: flags[currencyCode] ?? '',
            amount: entry.value.toStringAsFixed(0),
            isActive: isThisActive,
          ),
        );
      }).toList(),
    );
  }
}

class BalanceCard extends StatefulWidget {
  final String currency;
  final String flag;
  final String amount;
  final bool isActive;

  const BalanceCard({
    super.key,
    required this.currency,
    required this.flag,
    required this.amount,
    this.isActive = false,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isHovered = false;

  Color _getBorderColor() {
    if (widget.isActive) {
      return const Color(0xFF007AFF);
    }
    if (_isHovered) {
      return const Color(0xFF007AFF).withOpacity(0.5);
    }
    return const Color(0xFFE3E6EB);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _getBorderColor(),
            width: widget.isActive || _isHovered ? 1.5 : 1,
          ),
          color: widget.isActive ? const Color(0xFFEFF3F8) : Colors.white,
          boxShadow: _isHovered && !widget.isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.flag, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text(
                  widget.amount,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widget.isActive ? 16 : 14,
                    color: widget.isActive
                        ? const Color(0xFF007AFF)
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  widget.currency,
                  style: TextStyle(
                    color: widget.isActive
                        ? const Color(0xFF007AFF)
                        : Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            if (!widget.isActive) ...[
              const SizedBox(height: 4),
              Text(
                '${widget.amount} ${widget.currency}',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SummaryCardsRow extends StatelessWidget {
  final String? filter;
  final List<FundBankData> data;

  const SummaryCardsRow({super.key, required this.filter, required this.data});

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
