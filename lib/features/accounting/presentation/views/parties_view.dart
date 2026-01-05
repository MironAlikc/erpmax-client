import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_board/parties_board_switcher.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_header.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_stat_row.dart';
import 'package:flutter/material.dart';

class PartiesView extends StatelessWidget {
  final String title;

  const PartiesView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final stats = MockPartiesDataService.getStatistics();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimens.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PartiesHeader(title: title),
          gapH24,
          PartiesStatRow(stats: stats),
          gapH24,
          Row(children: [PartiesBoardSwitcher()]),
        ],
      ),
    );
  }
}
