import 'package:flutter/material.dart';

enum CurrencyFilter { all, usd, eur, gbp, sar }

String currencyLabel(CurrencyFilter f) =>
    f == CurrencyFilter.all ? 'ALL' : f.name.toUpperCase();

/// ------------------------------------------------------------
/// TOOLBAR
/// ------------------------------------------------------------
class CurrencyToolbar extends StatelessWidget {
  final CurrencyFilter selected;
  final ValueChanged<CurrencyFilter> onChanged;

  const CurrencyToolbar({
    super.key,
    required this.selected,
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

  /// ---------------- WIDE ----------------
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
        const Align(alignment: Alignment.centerRight, child: _Balances()),
      ],
    );
  }

  /// ---------------- NARROW ----------------
  Widget _narrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(spacing: 8, runSpacing: 8, children: [_filters(), _fundButton()]),
        const SizedBox(height: 12),
        const _Balances(),
      ],
    );
  }

  /// ---------------- FILTERS ----------------
  Widget _filters() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _chip('All', CurrencyFilter.all),
        _chip('USD', CurrencyFilter.usd, '🇺🇸'),
        _chip('EUR', CurrencyFilter.eur, '🇪🇺'),
        _chip('GBP', CurrencyFilter.gbp, '🇬🇧'),
        _chip('SAR', CurrencyFilter.sar, '🇸🇦'),
      ],
    );
  }

  Widget _chip(String label, CurrencyFilter value, [String? flag]) {
    final active = selected == value;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFEFF3F8) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE3E6EB)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (flag != null) ...[Text(flag), const SizedBox(width: 6)],
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
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

/// ------------------------------------------------------------
/// BALANCES
/// ------------------------------------------------------------

class _Balances extends StatelessWidget {
  const _Balances();

  @override
  Widget build(BuildContext context) {
    const cards = [
      BalanceCard(currency: 'SAR', flag: '🇸🇦', amount: '223 620'),
      BalanceCard(currency: 'USD', flag: '🇺🇸', amount: '23 000'),
      BalanceCard(currency: 'EUR', flag: '🇪🇺', amount: '7 000'),
      BalanceCard(currency: 'GBP', flag: '🇬🇧', amount: '3 000'),
    ];

    return Wrap(spacing: 12, runSpacing: 12, children: cards);
  }
}

class BalanceCard extends StatelessWidget {
  final String currency;
  final String flag;
  final String amount;

  const BalanceCard({
    super.key,
    required this.currency,
    required this.flag,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E6EB)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(flag, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(width: 6),
          Text(
            currency,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// SUMMARY
/// ------------------------------------------------------------
class SummaryCardsRow extends StatelessWidget {
  final CurrencyFilter filter;

  const SummaryCardsRow({super.key, required this.filter});

  static const double _minCardWidth = 220;
  static const double _spacing = 12;
  static const double _cardHeight = 90;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxCardsPerRow = ((width + _spacing) / (_minCardWidth + _spacing))
            .floor();
        final crossAxisCount = maxCardsPerRow.clamp(1, 4);

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
              title: 'Total Balance (${currencyLabel(filter)})',
              value: '94 059',
              color: Colors.blue,
              height: _cardHeight,
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

/// ------------------------------------------------------------
/// FUNDS MODEL
/// ------------------------------------------------------------
class FundBankAccount {
  final String name;
  final String? accountNumber;
  final String type;
  final double balance;
  final String currency;
  final bool isConverted;
  final List<CurrencyDetail> currencyDetails;
  final int todayChange;
  final String lastActivity;

  FundBankAccount({
    required this.name,
    this.accountNumber,
    required this.type,
    required this.balance,
    required this.currency,
    this.isConverted = false,
    required this.currencyDetails,
    required this.todayChange,
    required this.lastActivity,
  });
}

class CurrencyDetail {
  final String flag;
  final double amount;
  final String currency;

  CurrencyDetail({
    required this.flag,
    required this.amount,
    required this.currency,
  });
}

/// ------------------------------------------------------------
/// FUNDS & BANKS WIDGET (БЕЗ SCAFFOLD!)
/// ------------------------------------------------------------
class FundsAndBanksWidget extends StatefulWidget {
  const FundsAndBanksWidget({super.key});

  @override
  State<FundsAndBanksWidget> createState() => _FundsAndBanksWidgetState();
}

class _FundsAndBanksWidgetState extends State<FundsAndBanksWidget> {
  bool isGridView = true;

  final List<FundBankAccount> accounts = [
    FundBankAccount(
      name: 'Main Cash Fund',
      type: 'Cash',
      balance: 6784,
      currency: 'GBP',
      isConverted: true,
      currencyDetails: [
        CurrencyDetail(flag: '🇸🇦', amount: 15420, currency: 'SAR'),
        CurrencyDetail(flag: '🇺🇸', amount: 2500, currency: 'USD'),
        CurrencyDetail(flag: '🇪🇺', amount: 1800, currency: 'EUR'),
      ],
      todayChange: 0,
      lastActivity: '2 hours ago',
    ),
    FundBankAccount(
      name: 'Bank Al-Bilad',
      accountNumber: 'SA45 1234 5678 9012',
      type: 'Bank',
      balance: 27468,
      currency: 'GBP',
      isConverted: true,
      currencyDetails: [
        CurrencyDetail(flag: '🇸🇦', amount: 85200, currency: 'SAR'),
        CurrencyDetail(flag: '🇺🇸', amount: 12000, currency: 'USD'),
      ],
      todayChange: 0,
      lastActivity: '30 minutes ago',
    ),
    FundBankAccount(
      name: 'Petty Cash',
      type: 'Cash',
      balance: 527,
      currency: 'GBP',
      currencyDetails: [
        CurrencyDetail(flag: '🇸🇦', amount: 2500, currency: 'SAR'),
      ],
      todayChange: 0,
      lastActivity: '2 days ago',
    ),
    FundBankAccount(
      name: 'Al-Rajhi Bank',
      accountNumber: 'SA98 7654 3210 9876',
      type: 'Bank',
      balance: 39634,
      currency: 'GBP',
      isConverted: true,
      currencyDetails: [
        CurrencyDetail(flag: '🇸🇦', amount: 120500, currency: 'SAR'),
        CurrencyDetail(flag: '🇺🇸', amount: 6500, currency: 'USD'),
        CurrencyDetail(flag: '🇪🇺', amount: 5200, currency: 'EUR'),
        CurrencyDetail(flag: '🇬🇧', amount: 3000, currency: 'GBP'),
      ],
      todayChange: 500,
      lastActivity: '1 hour ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        isGridView ? _buildGridView() : _buildTableView(accounts),
        const SizedBox(height: 16),
        _buildFooter(),
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

  Widget _buildGridView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Адаптивное количество колонок
        final width = constraints.maxWidth;
        int crossAxisCount;
        double cardWidth;

        if (width >= 1200) {
          crossAxisCount = 4;
          cardWidth = (width - (3 * 16)) / 4; // 3 gaps
        } else if (width >= 900) {
          crossAxisCount = 3;
          cardWidth = (width - (2 * 16)) / 3; // 2 gaps
        } else if (width >= 600) {
          crossAxisCount = 2;
          cardWidth = (width - 16) / 2; // 1 gap
        } else {
          crossAxisCount = 1;
          cardWidth = width;
        }

        // Фиксированная высота карточки
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
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            return _buildGridCard(accounts[index]);
          },
        );
      },
    );
  }

  Widget _buildGridCard(FundBankAccount account) {
    return Container(
      height: 280, // Фиксированная высота
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
              const Text('🇬🇧', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              Text(
                account.currency,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              const Spacer(),
              if (account.isConverted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'conv',
                    style: TextStyle(fontSize: 9, color: Color(0xFFFF9800)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            account.balance
                .toStringAsFixed(0)
                .replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]} ',
                ),
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

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  // ОСНОВНОЙ ВИДЖЕТ ТАБЛИЦЫ
  Widget _buildTableView(List<FundBankAccount> accounts) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      // 1. Добавляем горизонтальную прокрутку, чтобы избежать переполнения на малых экранах
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          // Задаем минимальную ширину всей таблицы, чтобы колонки имели читаемый вид
          constraints: const BoxConstraints(minWidth: 1000),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2.5), // Немного увеличим для названия банка
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(2.5), // Увеличим для списка валют
              4: FlexColumnWidth(1.2),
              5: FlexColumnWidth(1.2),
              6: FlexColumnWidth(1.2), // Увеличим для кнопок действий
            },
            // Вертикальное выравнивание контента в ячейках
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                ),
                children: [
                  _buildTableHeader('Fund/Bank'),
                  _buildTableHeader('Type'),
                  _buildTableHeader('Balance (GBP)'),
                  _buildTableHeader('Currency Details'),
                  _buildTableHeader("Today's Change"),
                  _buildTableHeader('Last Activity'),
                  _buildTableHeader('Actions'),
                ],
              ),
              ...accounts.map((account) => _buildTableRow(account)),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(FundBankAccount account) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      children: [
        // Колонка 1: Bank Name
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Важно для вложенных Row
            children: [
              _buildBankIcon(account),
              const SizedBox(width: 12),
              Expanded(
                // Используем Expanded вместо Flexible для надежности в Row
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      account.accountNumber ?? 'Cash Fund',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Колонка 2: Type
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(child: _buildTypeBadge(account)),
        ),
        // Колонка 3: Balance
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildBalanceInfo(account),
        ),
        // Колонка 4: Currency Details
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildCurrencyList(account),
        ),
        // Колонка 5: Today's Change
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildChangeIndicator(account),
        ),
        // Колонка 6: Last Activity
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            account.lastActivity,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
        // Колонка 7: Actions
        Padding(
          padding: const EdgeInsets.all(8),
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
    );
  }

  // --- Вспомогательные мини-виджеты для чистоты кода ---

  Widget _buildBankIcon(FundBankAccount account) {
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

  Widget _buildTypeBadge(FundBankAccount account) {
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
      width:
          30, // Жестко ограничиваем размер, чтобы кнопки не расталкивали колонку
      child: IconButton(
        icon: Icon(icon, size: 18),
        onPressed: () {},
        color: Colors.grey[600],
        padding: EdgeInsets.zero,
        tooltip: tooltip,
      ),
    );
  }

  Widget _buildTableHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // Вспомогательная функция для форматирования чисел
  String _formatNum(double number) {
    return number
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        );
  }

  Widget _buildBalanceInfo(FundBankAccount account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _formatNum(account.balance),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),
        if (account.isConverted)
          const Text(
            'converted',
            style: TextStyle(fontSize: 10, color: Color(0xFFFF9800)),
          ),
      ],
    );
  }

  Widget _buildCurrencyList(FundBankAccount account) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: account.currencyDetails.map((detail) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '${detail.flag} ${_formatNum(detail.amount)} ${detail.currency}',
            style: const TextStyle(fontSize: 10),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChangeIndicator(FundBankAccount account) {
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

  Widget _buildFooter() {
    final totalBalance = accounts.fold<double>(
      0,
      (sum, account) => sum + account.balance,
    );
    final totalChange = accounts.fold<int>(
      0,
      (sum, account) => sum + account.todayChange,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2332),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Count:',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Text(
                '${accounts.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            totalBalance
                .toStringAsFixed(0)
                .replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]} ',
                ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                totalChange.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'GBP',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FundsAndBanksTable extends StatefulWidget {
  final List<FundBankAccount> accounts;
  const FundsAndBanksTable({super.key, required this.accounts});

  // Определяем фиксированные ширины для колонок
  static const double typeWidth = 100;
  static const double balanceWidth = 140;
  static const double changeWidth = 110;
  static const double activityWidth = 120;
  static const double actionsWidth = 120;
  static const double bankInfoMinWidth = 250; // Минималка для первой колонки

  @override
  State<FundsAndBanksTable> createState() => _FundsAndBanksTableState();
}

class _FundsAndBanksTableState extends State<FundsAndBanksTable> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Суммируем все фиксированные ширины + минималку для адаптивной колонки
        const double minTableWidth =
            FundsAndBanksTable.typeWidth +
            FundsAndBanksTable.balanceWidth +
            FundsAndBanksTable.changeWidth +
            FundsAndBanksTable.activityWidth +
            FundsAndBanksTable.actionsWidth +
            FundsAndBanksTable.bankInfoMinWidth +
            80; // запас на padding

        final double availableWidth = constraints.maxWidth;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: minTableWidth,
                  // Если экран шире минималки, растягиваемся на весь экран
                  maxWidth: availableWidth > minTableWidth
                      ? availableWidth
                      : minTableWidth,
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    ...widget.accounts.map((acc) => _buildRow(acc)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          const Expanded(child: _HeaderText('Fund/Bank')),
          const SizedBox(
            width: FundsAndBanksTable.typeWidth,
            child: _HeaderText('Type', textAlign: TextAlign.center),
          ),
          const SizedBox(
            width: FundsAndBanksTable.balanceWidth,
            child: _HeaderText('Balance (GBP)'),
          ),
          const Expanded(
            child: _HeaderText('Currency Details'),
          ), // Еще одна гибкая колонка
          const SizedBox(
            width: FundsAndBanksTable.changeWidth,
            child: _HeaderText("Today's Change", textAlign: TextAlign.center),
          ),
          const SizedBox(
            width: FundsAndBanksTable.activityWidth,
            child: _HeaderText('Last Activity', textAlign: TextAlign.center),
          ),
          const SizedBox(
            width: FundsAndBanksTable.actionsWidth,
            child: _HeaderText('Actions', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(FundBankAccount account) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          // 1. Bank Info (Flexible)
          Expanded(
            child: Row(
              children: [
                _buildIcon(account),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        account.accountNumber ?? 'Cash Fund',
                        style: TextStyle(color: Colors.grey[600], fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 2. Type
          SizedBox(
            width: FundsAndBanksTable.typeWidth,
            child: Center(child: _buildTypeBadge(account.type)),
          ),
          // 3. Balance
          SizedBox(
            width: FundsAndBanksTable.balanceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _format(account.balance),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                if (account.isConverted)
                  const Text(
                    'converted',
                    style: TextStyle(fontSize: 10, color: Colors.orange),
                  ),
              ],
            ),
          ),
          // 4. Currency Details (Flexible)
          Expanded(
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: account.currencyDetails
                  .map((d) => _buildMiniChip(d))
                  .toList(),
            ),
          ),
          // 5. Change
          SizedBox(
            width: FundsAndBanksTable.changeWidth,
            child: _buildChange(account.todayChange.toDouble()),
          ),
          // 6. Activity
          SizedBox(
            width: FundsAndBanksTable.activityWidth,
            child: Text(
              account.lastActivity,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          // 7. Actions
          SizedBox(
            width: FundsAndBanksTable.actionsWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _actionBtn(Icons.arrow_downward),
                _actionBtn(Icons.arrow_upward),
                _actionBtn(Icons.more_vert),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Вспомогательные методы (мини-виджеты) ---
  Widget _buildIcon(FundBankAccount acc) {
    bool isCash = acc.type == 'Cash';
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCash ? Colors.green[50] : Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isCash ? Icons.attach_money : Icons.account_balance,
        color: isCash ? Colors.green : Colors.blue,
        size: 20,
      ),
    );
  }

  Widget _buildTypeBadge(String type) {
    bool isCash = type == 'Cash';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isCash ? Colors.green[50] : Colors.blue[50],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 11,
          color: isCash ? Colors.green : Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMiniChip(CurrencyDetail d) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '${d.flag} ${_format(d.amount)} ${d.currency}',
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _buildChange(double val) {
    bool isPos = val >= 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isPos ? Icons.arrow_upward : Icons.arrow_downward,
          size: 14,
          color: isPos ? Colors.green : Colors.red,
        ),
        Text(
          '${isPos ? '+' : ''}$val',
          style: TextStyle(
            color: isPos ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _actionBtn(IconData icon) => SizedBox(
    width: 32,
    child: IconButton(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: Colors.grey[600]),
    ),
  );

  String _format(double n) => n
      .toStringAsFixed(0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]} ',
      );
}

class _HeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const _HeaderText(this.text, {this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
    );
  }
}
