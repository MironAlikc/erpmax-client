class SummaryEntity {
  final String title;
  final double value;
  final double changePercentage;
  final String currency;

  const SummaryEntity({
    required this.title,
    required this.value,
    required this.changePercentage,
    this.currency = '\$',
  });
}

