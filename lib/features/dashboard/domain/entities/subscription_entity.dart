class SubscriptionEntity {
  final String subNumber;
  final String client;
  final String package;
  final String startDate;
  final String endDate;
  final String tags;
  final String amount;
  final String paymentStatus;

  const SubscriptionEntity({
    required this.subNumber,
    required this.client,
    required this.package,
    required this.startDate,
    required this.endDate,
    required this.tags,
    required this.amount,
    required this.paymentStatus,
  });
}

