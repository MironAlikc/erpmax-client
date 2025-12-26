import 'package:erpmax_client/core/theme/app_theme.dart';
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
    final theme = context.theme.appColor;

    switch (title.toLowerCase()) {
      case 'total revenue':
        return theme.primary;
      case 'total expenses':
        return theme.error;
      case 'net profit':
        return theme.success;
      case 'cash flow':
        return theme.info;
      default:
        return theme.primary;
    }
  }
}
