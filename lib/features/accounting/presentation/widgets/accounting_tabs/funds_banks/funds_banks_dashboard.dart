import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_table.dart';
import 'package:flutter/material.dart';

const Map<String, double> exchangeRates = {
  'SAR': 1.0,
  'USD': 0.266,
  'EUR': 0.245,
  'GBP': 0.210,
};

// Универсальная функция: переводит сумму ИЗ любой валюты В целевую
double convertAmount(double amount, String from, String to) {
  if (from == to) return amount;

  // Сначала переводим в базовую валюту (SAR), если это не SAR
  double amountInSAR = (from == 'SAR')
      ? amount
      : amount / (exchangeRates[from] ?? 1.0);

  // Затем из SAR переводим в целевую
  return amountInSAR * (exchangeRates[to] ?? 1.0);
}

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1000;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
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
        _Balances(allAccounts: allAccounts, selectedCurrency: selected),
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

  /// ---------------- BUTTON ----------------
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
  final String? selectedCurrency; // Добавляем поле

  const _Balances({
    required this.allAccounts,
    this.selectedCurrency, // Добавляем в конструктор
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

        // КЛЮЧЕВАЯ ЛОГИКА:
        // Карточка активна, если её код совпадает с выбранным фильтром
        final bool isThisActive = selectedCurrency == currencyCode;

        return BalanceCard(
          currency: currencyCode,
          flag: flags[currencyCode] ?? '',
          amount: entry.value.toStringAsFixed(0),
          isActive: isThisActive, // Теперь здесь динамика!
        );
      }).toList(),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final String currency;
  final String flag;
  final String amount;
  final bool isActive; // Добавляем флаг активности

  const BalanceCard({
    super.key,
    required this.currency,
    required this.flag,
    required this.amount,
    this.isActive = false, // По умолчанию не активен
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // Если активен — подсвечиваем рамку и фон
        border: Border.all(
          color: isActive ? const Color(0xFF007AFF) : const Color(0xFFE3E6EB),
        ),
        color: isActive ? const Color(0xFFEFF3F8) : Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(flag, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  // Делаем шрифт больше, если валюта выбрана
                  fontSize: isActive ? 16 : 14,
                  color: isActive ? const Color(0xFF007AFF) : Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                currency,
                style: TextStyle(
                  color: isActive ? const Color(0xFF007AFF) : Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Показываем нижнюю строку только если карточка НЕ активна
          if (!isActive) ...[
            const SizedBox(height: 4),
            Text(
              '$amount $currency',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
            ),
          ],
        ],
      ),
    );
  }
}

// class _Balances extends StatelessWidget {
//   const _Balances();

//   @override
//   Widget build(BuildContext context) {
//     const cards = [
//       BalanceCard(currency: 'SAR', flag: '🇸🇦', amount: '223 620'),
//       BalanceCard(currency: 'USD', flag: '🇺🇸', amount: '23 000'),
//       BalanceCard(currency: 'EUR', flag: '🇪🇺', amount: '7 000'),
//       BalanceCard(currency: 'GBP', flag: '🇬🇧', amount: '3 000'),
//     ];

//     return Wrap(spacing: 12, runSpacing: 12, children: cards);
//   }
// }

// class BalanceCard extends StatelessWidget {
//   final String currency;
//   final String flag;
//   final String amount;

//   const BalanceCard({
//     super.key,
//     required this.currency,
//     required this.flag,
//     required this.amount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color(0xFFE3E6EB)),
//         color: Colors.white,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(flag, style: const TextStyle(fontSize: 18)),
//           const SizedBox(width: 8),
//           Text(
//             amount,
//             style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
//           ),
//           const SizedBox(width: 6),
//           Text(
//             currency,
//             style: const TextStyle(color: Colors.black54, fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SummaryCardsRow extends StatelessWidget {
  final String? filter;
  final List<FundBankData> data;

  const SummaryCardsRow({super.key, required this.filter, required this.data});

  static const double _minCardWidth = 220;
  static const double _spacing = 12;
  static const double _cardHeight = 90;

  double _calculateTotal() {
    // Если фильтр null (All), целевая валюта — SAR
    final targetCurrency = filter ?? 'SAR';

    double total = 0;
    for (var account in data) {
      // Ищем SAR в деталях или конвертируем основной баланс
      final detail = account.currencyDetails.firstWhere(
        (d) => d.currency == targetCurrency,
        orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
      );

      if (detail.amount != -1) {
        total += detail.amount;
      } else {
        // Конвертируем баланс аккаунта в SAR
        double rate = exchangeRates[targetCurrency] ?? 1.0;
        total += account.balance * rate;
      }
    }
    return total;
  }

  // double _calculateTotal() {
  //   if (filter == null) {
  //     // Если выбрано "All", суммируем базовые балансы всех аккаунтов
  //     return data.fold(0, (sum, item) => sum + item.balance);
  //   } else {
  //     // Если выбрана конкретная валюта, ищем её в currencyDetails каждого аккаунта
  //     double total = 0;
  //     for (var account in data) {
  //       for (var details in account.currencyDetails) {
  //         if (details.currency == filter) {
  //           total += details.amount;
  //         }
  //       }
  //     }
  //     return total;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxCardsPerRow = ((width + _spacing) / (_minCardWidth + _spacing))
            .floor();
        final crossAxisCount = maxCardsPerRow.clamp(1, 4);
        final totalBalance = _calculateTotal();
        // Название валюты для заголовка
        final label = filter ?? 'SAR'; // Или твоя дефолтная валюта

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
              title: 'Total Balance ($label)', // Динамический заголовок
              value: totalBalance.toStringAsFixed(0), // Посчитанное значение
              color: Colors.blue,
              height: 90,
            ),
            // SummaryCard(
            //   title: 'Total Balance (${currencyLabel(filter)})',
            //   value: '94 059',
            //   color: Colors.blue,
            //   height: _cardHeight,
            // ),
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

class FundsAndBanksWidget extends StatefulWidget {
  final List<FundBankData> data;
  final String? activeFilter;

  const FundsAndBanksWidget({super.key, required this.data, this.activeFilter});

  @override
  State<FundsAndBanksWidget> createState() => _FundsAndBanksWidgetState();
}

class _FundsAndBanksWidgetState extends State<FundsAndBanksWidget> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        isGridView
            ? _buildGridView(widget.data)
            : FundsBanksTable(
                accounts: widget.data,
                activeFilter: widget.activeFilter,
              ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Funds & Banks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('4', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(
                    isGridView ? Icons.grid_view : Icons.table_rows,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(isGridView ? 'Grid' : 'Table'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<FundBankData> data) {
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
    // Добавляем логику получения суммы для карточки
    // double displayAmount = account.balance;
    final String displayCurrency = widget.activeFilter ?? 'SAR';
    final String displayFlag = _getFlagFor(displayCurrency);

    // final String currentCurrency = widget.activeFilter ?? account.currency;
    // final String currentFlag = _getFlagFor(currentCurrency);

    // Рассчитываем сумму (логика такая же, как в методе выше)
    double displayAmount = account.balance;
    if (account.currency != displayCurrency) {
      final detail = account.currencyDetails.firstWhere(
        (d) => d.currency == displayCurrency,
        orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
      );
      if (detail.amount != -1) {
        displayAmount = detail.amount;
      } else {
        double rate = exchangeRates[displayCurrency] ?? 1.0;
        displayAmount = account.balance * rate;
      }
    }

    // if (widget.activeFilter != null) {
    //   displayCurrency = widget.activeFilter!;
    //   final detail = account.currencyDetails.firstWhere(
    //     (d) => d.currency == widget.activeFilter,
    //     orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
    //   );

    //   if (detail.amount != -1) {
    //     displayAmount = detail.amount;
    //   } else {
    //     double rate = exchangeRates[widget.activeFilter!] ?? 1.0;
    //     displayAmount = account.balance * rate;
    //   }
    // }

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
              // Пометка 'conv', если валюты нет в деталях, но мы её показываем
              if (widget.activeFilter != null &&
                  !account.currencyDetails.any(
                    (d) => d.currency == widget.activeFilter,
                  ))
                _buildConvertedBadge(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _formatNum(displayAmount),
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
        color: const Color(0xFFFFF3E0), // Светло-оранжевый фон
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'conv',
        style: TextStyle(
          fontSize: 9,
          color: Color(0xFFFF9800), // Оранжевый текст
          fontWeight: FontWeight.bold,
        ),
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
}
