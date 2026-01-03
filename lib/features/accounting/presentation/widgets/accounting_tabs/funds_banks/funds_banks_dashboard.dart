import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_table.dart';
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
        isGridView ? _buildGridView() : FundsBanksTable(accounts: accounts),
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
}
