class FundBankData {
  final String name;
  final String? accountNumber;
  final String type;
  final double balance;
  final String currency;
  final bool isConverted;
  final List<CurrencyModel> currencyDetails;
  final int todayChange;
  final String lastActivity;

  FundBankData({
    required this.name,
    this.accountNumber,
    required this.type,
    required this.balance,
    required this.currency,
    this.isConverted = false,
    required this.currencyDetails,
    required this.todayChange,
    required this.lastActivity,
  });
}

class CurrencyModel {
  final String flag;
  final double amount;
  final String currency;

  CurrencyModel({
    required this.flag,
    required this.amount,
    required this.currency,
  });
}
