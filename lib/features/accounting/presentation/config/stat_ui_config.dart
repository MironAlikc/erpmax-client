import 'package:flutter/material.dart';

class StatUIConfig {
  static IconData getIconForStat(String title) {
    switch (title.toLowerCase()) {
      case 'total revenue':
        return Icons.trending_up;
      case 'total expenses':
        return Icons.trending_down;
      case 'net profit':
        return Icons.attach_money;
      case 'cash flow':
        return Icons.account_balance_wallet_outlined;
      default:
        return Icons.analytics_outlined;
    }
  }

  static Color getColorForStat(String title, BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    switch (title.toLowerCase()) {
      case 'total revenue':
        return theme.primary;
      case 'total expenses':
        return theme.error;
      case 'net profit':
        return Colors.green;
      case 'cash flow':
        return Colors.blue;
      default:
        return theme.primary;
    }
  }
}
