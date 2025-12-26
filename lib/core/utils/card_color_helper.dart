import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';

class CardColorHelper {
  static Color getCardColor(AppColorExtension? colors, int index) {
    if (colors == null) return Colors.blue;

    final List<Color> palette = [
      colors.primary,
      colors.success,
      colors.warning,
      colors.infoText,
    ];
    return palette[index % palette.length];
  }
}
