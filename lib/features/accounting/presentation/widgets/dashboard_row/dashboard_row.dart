import 'package:erpmax_client/features/accounting/presentation/widgets/dashboard_row/overdue_receivable_card.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/dashboard_row/vat_summary_card.dart';
import 'package:flutter/material.dart';

class DashboardRow extends StatelessWidget {
  const DashboardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 3, child: OverdueReceivablesCard()),
        SizedBox(width: 16),
        Expanded(flex: 2, child: VatSummaryCard()),
        Expanded(flex: 1, child: SizedBox.shrink()),
      ],
    );
  }
}
