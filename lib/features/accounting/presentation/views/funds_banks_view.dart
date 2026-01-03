import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_dashboard.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_header.dart';
import 'package:flutter/widgets.dart';

class FundsBanksView extends StatelessWidget {
  final String title;

  const FundsBanksView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final selectedCurrency = ValueNotifier<CurrencyFilter>(CurrencyFilter.all);

    return ValueListenableBuilder<CurrencyFilter>(
      valueListenable: selectedCurrency,
      builder: (context, selected, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDesign.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FundsBanksHeader(title: title),
              const SizedBox(height: 16),

              CurrencyToolbar(
                selected: selected,
                onChanged: (v) => selectedCurrency.value = v,
              ),

              const SizedBox(height: 16),
              SummaryCardsRow(filter: selected),
              const SizedBox(height: 24),
              FundsAndBanksWidget(),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
