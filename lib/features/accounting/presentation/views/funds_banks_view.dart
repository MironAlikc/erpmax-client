import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_dashboard.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_header.dart';
import 'package:flutter/widgets.dart';

final List<FundBankData> accounts = [
  FundBankData(
    name: 'Main Cash Fund',
    type: 'Cash',
    balance: 6784,
    currency: 'GBP',
    isConverted: true,
    currencyDetails: [
      CurrencyModel(flag: '🇸🇦', amount: 15420, currency: 'SAR'),
      CurrencyModel(flag: '🇺🇸', amount: 2500, currency: 'USD'),
      CurrencyModel(flag: '🇪🇺', amount: 1800, currency: 'EUR'),
    ],
    todayChange: 0,
    lastActivity: '2 hours ago',
  ),
  FundBankData(
    name: 'Bank Al-Bilad',
    accountNumber: 'SA45 1234 5678 9012',
    type: 'Bank',
    balance: 27468,
    currency: 'GBP',
    isConverted: true,
    currencyDetails: [
      CurrencyModel(flag: '🇸🇦', amount: 85200, currency: 'SAR'),
      CurrencyModel(flag: '🇺🇸', amount: 12000, currency: 'USD'),
    ],
    todayChange: 0,
    lastActivity: '30 minutes ago',
  ),
  FundBankData(
    name: 'Petty Cash',
    type: 'Cash',
    balance: 527,
    currency: 'GBP',
    currencyDetails: [
      CurrencyModel(flag: '🇸🇦', amount: 2500, currency: 'SAR'),
    ],
    todayChange: 0,
    lastActivity: '2 days ago',
  ),
  FundBankData(
    name: 'Al-Rajhi Bank',
    accountNumber: 'SA98 7654 3210 9876',
    type: 'Bank',
    balance: 39634,
    currency: 'GBP',
    isConverted: true,
    currencyDetails: [
      CurrencyModel(flag: '🇸🇦', amount: 120500, currency: 'SAR'),
      CurrencyModel(flag: '🇺🇸', amount: 6500, currency: 'USD'),
      CurrencyModel(flag: '🇪🇺', amount: 5200, currency: 'EUR'),
      CurrencyModel(flag: '🇬🇧', amount: 3000, currency: 'GBP'),
    ],
    todayChange: 500,
    lastActivity: '1 hour ago',
  ),
];

class FundsBanksView extends StatefulWidget {
  // Теперь StatefulWidget
  final String title;
  const FundsBanksView({super.key, required this.title});

  @override
  State<FundsBanksView> createState() => _FundsBanksViewState();
}

class _FundsBanksViewState extends State<FundsBanksView> {
  // Выносим notifier сюда. Он создается один раз за жизнь виджета.
  late final ValueNotifier<String?> _selectedCurrency;

  @override
  void initState() {
    super.initState();
    _selectedCurrency = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _selectedCurrency.dispose(); // Не забываем освобождать ресурсы
    super.dispose();
  }

  // Вспомогательная функция (можно оставить здесь или вынести в утилиты)
  List<CurrencyModel> _getUniqueCurrencies(List<FundBankData> data) {
    final Map<String, CurrencyModel> unique = {};
    for (var account in data) {
      for (var details in account.currencyDetails) {
        if (!unique.containsKey(details.currency)) {
          unique[details.currency] = details;
        }
      }
    }
    return unique.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _selectedCurrency,
      builder: (context, filter, _) {
        final availableCurrencies = _getUniqueCurrencies(accounts);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDesign.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FundsBanksHeader(title: widget.title),
              const SizedBox(height: 24),
              CurrencyToolbar(
                selected: filter,
                currencies: availableCurrencies,
                allAccounts: accounts,
                onChanged: (v) => _selectedCurrency.value =
                    v, // Обновляем существующий notifier
              ),
              SummaryCardsRow(filter: filter, data: accounts),
              const SizedBox(height: 24),
              // Теперь пробрасываем в таблицу
              FundsAndBanksWidget(data: accounts, activeFilter: filter),
            ],
          ),
        );
      },
    );
  }
}

// class FundsBanksView extends StatelessWidget {
//   final String title;
//   const FundsBanksView({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     final selectedCurrency = ValueNotifier<String?>(null);

//     List<CurrencyModel> getUniqueCurrencies(List<FundBankData> data) {
//       final Map<String, CurrencyModel> unique = {};

//       for (var account in data) {
//         for (var details in account.currencyDetails) {
//           if (!unique.containsKey(details.currency)) {
//             unique[details.currency] = details;
//           }
//         }
//       }
//       return unique.values.toList();
//     }

//     return ValueListenableBuilder<String?>(
//       valueListenable: selectedCurrency,
//       builder: (context, filter, _) {
//         final availableCurrencies = getUniqueCurrencies(accounts);

//         // final filteredData = accounts.where((fund) {
//         //   if (filter == null) return true;
//         //   return fund.currencyDetails.any((d) => d.currency == filter);
//         // }).toList();

//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(AppDesign.pagePadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               FundsBanksHeader(title: title),
//               const SizedBox(height: 24),
//               CurrencyToolbar(
//                 selected: filter,
//                 currencies: availableCurrencies,
//                 allAccounts: accounts,
//                 onChanged: (v) => selectedCurrency.value = v,
//               ),
//               SummaryCardsRow(filter: filter, data: accounts),
//               const SizedBox(height: 24),
//               FundsAndBanksWidget(data: accounts, activeFilter: filter),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
