import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/journal_entries/journal_entries_header/journal_entries_header.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/journal_entries/journal_entries_summary_metrics_bar.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/journal_entries/journal_entry_table.dart';
import 'package:flutter/material.dart';

class JournalEntriesView extends StatelessWidget {
  final String title;

  const JournalEntriesView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // final bool isMobile = MediaQuery.of(context).size.width < 1100;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          JournalEntriesHeader(title: title),
          const SizedBox(height: 16),
          JournalEntriesSummaryMetricsBar(),

          const SizedBox(height: 24),
          JournalEntryTable(),

          // EmptyStatePlaceholder(
          //   message: AppLocalizations.of(context).accPleaseSelectAccount,
          // ),
        ],
      ),
    );
  }
}
