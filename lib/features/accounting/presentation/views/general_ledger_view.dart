import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/general_ledger/general_ledger_filters/general_ledger_advanced_filters.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/general_ledger/general_ledger_filters/general_ledger_filter_bar.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/general_ledger/general_ledger_header/general_ledger_header.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/empty_state_placeholder.dart';
import 'package:flutter/material.dart';

class GeneralLedgerView extends StatelessWidget {
  final String title;

  const GeneralLedgerView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimens.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GeneralLedgerHeader(title: title),
          const SizedBox(height: 8),
          Divider(height: 1, thickness: 1, color: theme.border),
          const SizedBox(height: 8),
          const GeneralLedgerFilterBar(),
          const SizedBox(height: 8),
          Divider(height: 1, thickness: 1, color: theme.border),
          const SizedBox(height: 8),
          const GeneralLedgerAdvancedFilters(),
          const SizedBox(height: 8),
          Divider(height: 1, thickness: 1, color: theme.border),

          const SizedBox(height: 24),

          EmptyStatePlaceholder(
            message: AppLocalizations.of(context).accPleaseSelectAccount,
          ),
        ],
      ),
    );
  }
}
