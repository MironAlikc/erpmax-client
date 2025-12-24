class AccountEntity {
  final String accountNumber;
  final String accountName;
  final double balance;
  final String category;

  const AccountEntity({
    required this.accountNumber,
    required this.accountName,
    required this.balance,
    required this.category,
  });

  bool get isPositiveBalance => balance >= 0;
}
