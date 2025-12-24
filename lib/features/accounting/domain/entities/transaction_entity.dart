class TransactionEntity {
  final String reference;
  final DateTime date;
  final String description;
  final double amount;
  final TransactionStatus status;

  const TransactionEntity({
    required this.reference,
    required this.date,
    required this.description,
    required this.amount,
    required this.status,
  });

  bool get isPositive => amount >= 0;
}

enum TransactionStatus { posted, draft, cancelled }
