import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/chart_of_accounts_header/chart_of_accounts_header.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/chart_of_accounts_table.dart';
import 'package:flutter/material.dart';

class ChartOfAccountsView extends StatelessWidget {
  final String title;

  const ChartOfAccountsView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    // final bool isMobile = MediaQuery.of(context).size.width < 1100;

    // ! Simulation of data acquisition
    final data = getMockChartOfAccountsData();
    final accounts = (data['accounts'] as List<dynamic>)
        .map((e) => AccountNode.fromJson(e as Map<String, dynamic>))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartOfAccountsHeader(title: title),
          const SizedBox(height: 24),
          ChartOfAccountsBody(accounts: accounts),
        ],
      ),
    );
  }
}
