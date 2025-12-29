import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

class FinancialSummarySection extends StatelessWidget {
  const FinancialSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(child: CashFlowCard()),
          SizedBox(width: 16),
          Expanded(child: ExpenseBreakdownCard()),
        ],
      ),
    );
  }
}

/// -------------------- CASH FLOW --------------------

class CashFlowCard extends StatelessWidget {
  const CashFlowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _CardContainer(
      title: AppLocalizations.of(context).cashFlow,
      icon: Icons.bar_chart,
      child: Column(
        children: const [
          CashFlowRow(month: 'Jan', income: 85000, expense: 62000),
          SizedBox(height: 12),
          CashFlowRow(month: 'Feb', income: 92000, expense: 71000),
          SizedBox(height: 12),
          CashFlowRow(month: 'Mar', income: 78000, expense: 58000),
        ],
      ),
    );
  }
}

class CashFlowRow extends StatelessWidget {
  final String month;
  final int income;
  final int expense;

  const CashFlowRow({
    super.key,
    required this.month,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final net = income - expense;
    final total = income + expense;
    final incomePercent = income / total;
    final expensePercent = expense / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(month, style: const TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            Text(
              '+${_format(net)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Row(
            children: [
              Expanded(
                flex: (incomePercent * 100).round(),
                child: Container(height: 8, color: Colors.green),
              ),
              Expanded(
                flex: (expensePercent * 100).round(),
                child: Container(height: 8, color: Colors.redAccent),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('In: ${_format(income)}', style: _subTextStyle()),
            const Spacer(),
            Text('Out: ${_format(expense)}', style: _subTextStyle()),
          ],
        ),
      ],
    );
  }
}

/// -------------------- EXPENSE BREAKDOWN --------------------

class ExpenseBreakdownCard extends StatelessWidget {
  const ExpenseBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return _CardContainer(
      title: localizations.accExpenseBreakdown,
      icon: Icons.pie_chart,
      child: Column(
        children: [
          ExpenseRow(
            label: localizations.accSalaries,
            value: 45000,
            color: Colors.blue,
          ),
          ExpenseRow(
            label: localizations.accRent,
            value: 15000,
            color: Colors.green,
          ),
          ExpenseRow(
            label: localizations.accUtilities,
            value: 8000,
            color: Colors.orange,
          ),
          ExpenseRow(
            label: localizations.accMarketing,
            value: 12000,
            color: Colors.purple,
          ),
          ExpenseRow(
            label: localizations.accOthers,
            value: 20000,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class ExpenseRow extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const ExpenseRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    const maxValue = 50000;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: value / maxValue,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _format(value),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// -------------------- SHARED --------------------

class _CardContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _CardContainer({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Color(0x11000000))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Icon(icon, size: 18),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

TextStyle _subTextStyle() {
  return TextStyle(fontSize: 11, color: Colors.grey.shade600);
}

String _format(int value) {
  return value.toString().replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]} ',
  );
}
