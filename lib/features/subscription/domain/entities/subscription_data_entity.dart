class SubscriptionDataEntity {
  final String company;
  final String package;
  final String endDate;
  final String tag;
  final String amount;
  final String paymentStatus;

  const SubscriptionDataEntity({
    required this.company,
    required this.package,
    required this.endDate,
    required this.tag,
    required this.amount,
    required this.paymentStatus,
  });
}

