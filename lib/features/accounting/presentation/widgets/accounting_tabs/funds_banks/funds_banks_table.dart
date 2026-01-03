import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_dashboard.dart';
import 'package:flutter/material.dart';

class FundsBanksTable extends StatelessWidget {
  final List<FundBankData> accounts;
  final String? activeFilter; // Добавили это

  const FundsBanksTable({super.key, required this.accounts, this.activeFilter});

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
          _FundsTableHeader(),
          Divider(height: 1, color: theme.border),
          ...accounts.map(
            (account) => FundsRow(account: account, activeFilter: activeFilter),
          ),
          _FundsTableFooter(),
        ],
      ),
    );
  }
}

class FundsRow extends StatefulWidget {
  final FundBankData account;
  final String? activeFilter; // Принимаем фильтр

  const FundsRow({super.key, required this.account, this.activeFilter});

  @override
  State<FundsRow> createState() => _FundsRowState();
}

class _FundsRowState extends State<FundsRow> {
  bool _isHovered = false;

  // Универсальный помощник для получения суммы
  double getAmountForCurrency(String targetCurrency) {
    // 1. Проверяем, совпадает ли основная валюта аккаунта с целью
    if (widget.account.currency == targetCurrency)
      return widget.account.balance;

    // 2. Ищем в деталях (currencyDetails)
    final detail = widget.account.currencyDetails.firstWhere(
      (d) => d.currency == targetCurrency,
      orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
    );
    if (detail.amount != -1) return detail.amount;

    // 3. Если нет, конвертируем
    double rate = exchangeRates[targetCurrency] ?? 1.0;
    return widget.account.balance * rate;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // final double currentDisplayAmount = _getDisplayAmount();
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

  // Вспомогательная функция для получения суммы в нужной валюте
  double _getDisplayAmount() {
    final filter = widget.activeFilter;

    // 1. Если "All", возвращаем основной баланс аккаунта
    if (filter == null) return widget.account.balance;

    // 2. Ищем, есть ли эта валюта уже в списке деталей
    final existingDetail = widget.account.currencyDetails.firstWhere(
      (d) => d.currency == filter,
      orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
    );

    if (existingDetail.amount != -1) return existingDetail.amount;

    // 3. Если валюты нет, конвертируем основной баланс
    // Логика: Баланс (в SAR) * Курс выбранной валюты
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

  String _formatNum(double number) {
    return number
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        );
  }

  // Widget _buildBalanceInfo(FundBankData account) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         _formatNum(account.balance),
  //         style: const TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xFF4CAF50),
  //         ),
  //       ),
  //       if (account.isConverted)
  //         const Text(
  //           'converted',
  //           style: TextStyle(fontSize: 10, color: Color(0xFFFF9800)),
  //         ),
  //     ],
  //   );
  // }

  Widget _buildBalanceInfo(
    FundBankData account,
    double amount,
    String currency,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_formatNum(amount)} $currency',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),
        // Если это "виртуальная" конвертация, можно оставить пометку
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

  // Обновленный список валют (теперь он подсвечивает или добавляет валюту)
  Widget _buildCurrencyList(FundBankData account) {
    final filter = widget.activeFilter;

    // Если "All", показываем все как было
    if (filter == null) {
      return Wrap(
        spacing: 4,
        runSpacing: 4,
        children: account.currencyDetails
            .map((detail) => _miniBadge(detail, false))
            .toList(),
      );
    }

    // Если выбран фильтр, мы должны показать:
    // 1. Либо подсвеченную существующую валюту
    // 2. Либо "виртуальную" сконвертированную плашку

    bool existsInDetails = account.currencyDetails.any(
      (d) => d.currency == filter,
    );

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        if (!existsInDetails)
          // Показываем виртуальную плашку (серую или с пометкой)
          _miniBadge(
            CurrencyModel(
              flag: _getFlagFor(filter),
              amount: _getDisplayAmount(),
              currency: filter,
            ),
            true, // подсвечиваем
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
        '${detail.flag} ${_formatNum(detail.amount)} ${detail.currency}${isConverted ? '*' : ''}',
        style: TextStyle(
          fontSize: 10,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          color: isHighlighted ? const Color(0xFF007AFF) : Colors.black87,
        ),
      ),
    );
  }

  String _getFlagFor(String code) {
    switch (code) {
      case 'USD':
        return '🇺🇸';
      case 'EUR':
        return '🇪🇺';
      case 'GBP':
        return '🇬🇧';
      case 'SAR':
        return '🇸🇦';
      default:
        return '🏳️';
    }
  }

  // Widget _buildCurrencyList(FundBankData account) {
  //   return Wrap(
  //     spacing: 4,
  //     runSpacing: 4,
  //     children: account.currencyDetails.map((detail) {
  //       return Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  //         decoration: BoxDecoration(
  //           color: Colors.grey[100],
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         child: Text(
  //           '${detail.flag} ${_formatNum(detail.amount)} ${detail.currency}',
  //           style: const TextStyle(fontSize: 10),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }

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
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

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
              'Balance(SAR)',
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
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

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
          Expanded(flex: 3, child: Text('Count: 4', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 3, child: Text('352 720', style: style)),
          Expanded(
            flex: 2,
            child: Text('8 500', style: style, textAlign: TextAlign.center),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          SizedBox(
            width: 90,
            child: Text('SAR', style: style, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
