import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_header.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_stat_row.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/billing_table_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/filter_bar_table.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/invoices_mock_data.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/status_badge.dart';
import 'package:flutter/material.dart';

class BillingView extends StatefulWidget {
  final String title;
  const BillingView({super.key, required this.title});

  @override
  State<BillingView> createState() => _BillingViewState();
}

class _BillingViewState extends State<BillingView> {
  InvoiceStatus? _selectedStatus;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final stats = MockInvoicesDataService.getStatistics();

    final allInvoices = MockInvoicesDataService.getInvoices();

    final filteredInvoices = allInvoices.where((invoice) {
      final matchesStatus =
          _selectedStatus == null || invoice.status == _selectedStatus;

      final matchesSearch =
          invoice.invoiceNumber.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          invoice.tenantName.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimens.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BillingHeader(title: widget.title),
          gapH24,
          BillingStatRow(stats: stats),
          gapH24,

          FilterBarTable(
            selectedStatus: _selectedStatus,
            countText:
                '${filteredInvoices.length} ${AppLocalizations.of(context).labelInvoices}',
            onSearchChanged: (value) {
              setState(() => _searchQuery = value);
            },
            onStatusChanged: (status) {
              setState(() => _selectedStatus = status);
            },
          ),

          gapH24,

          BillingTableView(invoices: filteredInvoices),
        ],
      ),
    );
  }
}
