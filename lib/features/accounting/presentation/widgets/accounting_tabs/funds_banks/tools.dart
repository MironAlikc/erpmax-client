const Map<String, double> exchangeRates = {
  'SAR': 1.0,
  'USD': 0.266,
  'EUR': 0.245,
  'GBP': 0.210,
};

String formatNum(double number) {
  return number
      .toStringAsFixed(0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]} ',
      );
}

String getFlagFor(String code) {
  switch (code) {
    case 'USD':
      return '🇺🇸';
    case 'EUR':
      return '🇪🇺';
    case 'GBP':
      return '🇬🇧';
    case 'SAR':
      return '🇸🇦';
    default:
      return '🏳️';
  }
}
