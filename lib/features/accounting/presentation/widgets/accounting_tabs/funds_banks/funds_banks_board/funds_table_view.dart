import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:flutter/material.dart';

class FundsTableView extends StatelessWidget {
  final List<FundBankData> accounts;
  final String? activeFilter;

  const FundsTableView({super.key, required this.accounts, this.activeFilter});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FundsTableHeader(activeFilter: activeFilter),
          Divider(height: 1, color: theme.border),
          ...accounts.map(
            (account) => FundsRow(account: account, activeFilter: activeFilter),
          ),
          _FundsTableFooter(accounts: accounts, activeFilter: activeFilter),
        ],
      ),
    );
  }
}

class FundsRow extends StatefulWidget {
  final FundBankData account;
  final String? activeFilter;

  const FundsRow({super.key, required this.account, this.activeFilter});

  @override
  State<FundsRow> createState() => _FundsRowState();
}

class _FundsRowState extends State<FundsRow> {
  bool _isHovered = false;

  double getAmountForCurrency(String targetCurrency) {
    final double targetRate = exchangeRates[targetCurrency] ?? 1.0;
    double totalEquivalent = 0;

    for (var detail in widget.account.currencyDetails) {
      double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;

      totalEquivalent += (detail.amount / currentCurrencyRate) * targetRate;
    }

    if (totalEquivalent == 0 && widget.account.balance > 0) {
      double accountBaseRate = exchangeRates[widget.account.currency] ?? 1.0;
      totalEquivalent = (widget.account.balance / accountBaseRate) * targetRate;
    }

    return totalEquivalent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String currentDisplayCurrency = widget.activeFilter ?? 'SAR';

    final double currentDisplayAmount = getAmountForCurrency(
      currentDisplayCurrency,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        color: _isHovered ? Colors.grey[50] : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  _buildBankIcon(widget.account),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.account.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.account.accountNumber ?? 'Cash Fund',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(child: _buildTypeBadge(widget.account)),
            ),
            Expanded(
              flex: 2,
              child: _buildBalanceInfo(
                widget.account,
                currentDisplayAmount,
                currentDisplayCurrency,
              ),
            ),
            Expanded(flex: 3, child: _buildCurrencyList(widget.account)),
            Expanded(flex: 2, child: _buildChangeIndicator(widget.account)),
            Expanded(
              flex: 2,
              child: Text(
                widget.account.lastActivity,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(Icons.arrow_downward, 'Withdraw'),
                  _buildActionButton(Icons.arrow_upward, 'Deposit'),
                  _buildActionButton(Icons.more_vert, 'More'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getDisplayAmount() {
    final filter = widget.activeFilter;

    if (filter == null) return widget.account.balance;

    final existingDetail = widget.account.currencyDetails.firstWhere(
      (d) => d.currency == filter,
      orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
    );

    if (existingDetail.amount != -1) return existingDetail.amount;

    double rate = exchangeRates[filter] ?? 1.0;
    return widget.account.balance * rate;
  }

  Widget _buildBankIcon(FundBankData account) {
    final isCash = account.type == 'Cash';
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCash ? const Color(0xFFE8F5E9) : const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isCash ? Icons.attach_money : Icons.account_balance,
        color: isCash ? const Color(0xFF4CAF50) : const Color(0xFF2196F3),
        size: 20,
      ),
    );
  }

  Widget _buildTypeBadge(FundBankData account) {
    final isCash = account.type == 'Cash';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isCash ? const Color(0xFFE8F5E9) : const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        account.type,
        style: TextStyle(
          fontSize: 11,
          color: isCash ? const Color(0xFF4CAF50) : const Color(0xFF2196F3),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String tooltip) {
    return SizedBox(
      width: 30,
      child: IconButton(
        icon: Icon(icon, size: 18),
        onPressed: () {},
        color: Colors.grey[600],
        padding: EdgeInsets.zero,
        tooltip: tooltip,
      ),
    );
  }

  Widget _buildBalanceInfo(
    FundBankData account,
    double amount,
    String currency,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${formatNum(amount)} $currency',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),
        if (widget.activeFilter != null &&
            !account.currencyDetails.any(
              (d) => d.currency == widget.activeFilter,
            ))
          const Text(
            'converted',
            style: TextStyle(fontSize: 10, color: Color(0xFFFF9800)),
          ),
      ],
    );
  }

  Widget _buildCurrencyList(FundBankData account) {
    final filter = widget.activeFilter;

    if (filter == null) {
      return Wrap(
        spacing: 4,
        runSpacing: 4,
        children: account.currencyDetails
            .map((detail) => _miniBadge(detail, false))
            .toList(),
      );
    }

    bool existsInDetails = account.currencyDetails.any(
      (d) => d.currency == filter,
    );

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        if (!existsInDetails)
          _miniBadge(
            CurrencyModel(
              flag: getFlagFor(filter),
              amount: _getDisplayAmount(),
              currency: filter,
            ),
            true,
            isConverted: true,
          ),

        ...account.currencyDetails.map((detail) {
          final isHighlighted = detail.currency == filter;
          return _miniBadge(detail, isHighlighted);
        }),
      ],
    );
  }

  Widget _miniBadge(
    CurrencyModel detail,
    bool isHighlighted, {
    bool isConverted = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFEFF3F8) : Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isHighlighted
              ? const Color(0xFF007AFF).withOpacity(0.3)
              : Colors.transparent,
        ),
      ),
      child: Text(
        '${detail.flag} ${formatNum(detail.amount)} ${detail.currency}${isConverted ? '*' : ''}',
        style: TextStyle(
          fontSize: 10,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          color: isHighlighted ? const Color(0xFF007AFF) : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildChangeIndicator(FundBankData account) {
    final isPositive = account.todayChange >= 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
          color: isPositive ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
          size: 14,
        ),
        Text(
          '${isPositive ? '+' : ''}${account.todayChange}',
          style: TextStyle(
            fontSize: 13,
            color: isPositive
                ? const Color(0xFF4CAF50)
                : const Color(0xFFF44336),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _FundsTableHeader extends StatelessWidget {
  final String? activeFilter;

  const _FundsTableHeader({this.activeFilter});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

    final String currentCurrency = activeFilter ?? 'SAR';

    return Container(
      decoration: BoxDecoration(
        color: theme.gray50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text('Fund/Bank', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.type,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Balance($currentCurrency)',
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Currency Details',
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Today\'s Change',
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Last Activity',
              style: style,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            width: 90,
            child: Text(
              localizations.actions,
              style: style,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FundsTableFooter extends StatelessWidget {
  final List<FundBankData> accounts;
  final String? activeFilter;

  const _FundsTableFooter({required this.accounts, this.activeFilter});

  // Метод подсчета общей суммы по всем банкам
  double _calculateGrandTotal() {
    final targetCurrency = activeFilter ?? 'SAR';
    final double targetRate = exchangeRates[targetCurrency] ?? 1.0;

    double grandTotal = 0;

    for (var account in accounts) {
      for (var detail in account.currencyDetails) {
        double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;
        // Конвертация: (Сумма / Курс этой валюты) * Курс цели
        grandTotal += (detail.amount / currentCurrencyRate) * targetRate;
      }
    }
    return grandTotal;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

    final totalAmount = _calculateGrandTotal();
    final displayCurrency = activeFilter ?? 'SAR';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: theme.primaryFooter,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text('Count: ${accounts.length}', style: style),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 3, child: Text(formatNum(totalAmount), style: style)),
          Expanded(
            flex: 2,
            child: Text('8 500', style: style, textAlign: TextAlign.center),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          SizedBox(
            width: 90,
            child: Text(
              displayCurrency,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
