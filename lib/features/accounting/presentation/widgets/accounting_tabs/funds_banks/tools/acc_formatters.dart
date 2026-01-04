import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

abstract final class AccFormatters {
  static String formatChangeText(String change) {
    final cleanChange = change.trim();
    if (cleanChange.isEmpty) return "";

    String sign = "";
    String digits = cleanChange;

    if (cleanChange.startsWith('+') || cleanChange.startsWith('-')) {
      sign = cleanChange[0];
      digits = cleanChange.substring(1);
    }

    digits = digits.replaceAll(RegExp(r'[^0-9]'), '');

    final formattedDigits = digits.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]} ',
    );

    return '$sign$formattedDigits'.trim();
  }

  static IconData getChangeIcon(String change) {
    final cleanChange = change.trim();

    if (cleanChange.startsWith('-')) {
      return LucideIcons.trendingDown;
    }

    if (cleanChange.startsWith('+')) {
      return LucideIcons.trendingUp;
    }

    return LucideIcons.wallet;
  }

  static Color getChangeColor(BuildContext context, String change) {
    final cleanChange = change.trim();
    final colors = context.theme.appColor;

    if (cleanChange.startsWith('-')) {
      return colors.errorText;
    }

    if (cleanChange.startsWith('+')) {
      return colors.successText;
    }

    return colors.textPrimary;
  }
}
