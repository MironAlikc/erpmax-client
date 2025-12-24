import 'package:flutter/material.dart';

class QuickActionUIConfig {
  static IconData getIconFromName(String iconName) {
    switch (iconName) {
      case 'description_outlined':
        return Icons.description_outlined;
      case 'account_balance_wallet_outlined':
        return Icons.account_balance_wallet_outlined;
      case 'swap_horiz':
        return Icons.swap_horiz;
      case 'file_download_outlined':
        return Icons.file_download_outlined;
      case 'menu_book':
        return Icons.menu_book;
      default:
        return Icons.help_outline;
    }
  }
}
