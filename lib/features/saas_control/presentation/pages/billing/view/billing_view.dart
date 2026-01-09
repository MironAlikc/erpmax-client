import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_header.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_stat_row.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_table_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/invoices_mock_data.dart';
import 'package:flutter/material.dart';

class BillingView extends StatelessWidget {
  final String title;

  const BillingView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final stats = MockInvoicesDataService.getStatistics();
    final invoices = MockInvoicesDataService.getInvoices();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimens.p24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BillingHeader(title: title),
          gapH24,
          BillingStatRow(stats: stats),
          gapH24,
          BillingTableView(invoices: invoices),
        ],
      ),
    );
  }
}
