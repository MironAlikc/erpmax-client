import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/accounts_control_section/overdue_receivable_card.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/accounts_control_section/vat_summary_card.dart';
import 'package:flutter/material.dart';

class AccountsControlSection extends StatelessWidget {
  const AccountsControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(flex: 3, child: OverdueReceivablesCard()),
          SizedBox(width: 16),
          Expanded(flex: 2, child: VatSummaryCard()),
          Expanded(flex: 1, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
