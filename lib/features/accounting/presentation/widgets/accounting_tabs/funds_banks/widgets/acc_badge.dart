import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccBadge extends StatelessWidget {
  final String value;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final double? size;
  final double? borderRadius;
  final bool? isBold;

  const AccBadge({
    super.key,
    required this.value,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.size,
    this.borderRadius,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    if (value == '0' || value.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      constraints: BoxConstraints(
        minWidth: size ?? Dimens.p24,
        minHeight: size ?? Dimens.p24,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.primaryLight,
        borderRadius: BorderRadius.circular(borderRadius ?? Dimens.p6),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1)
            : null,
      ),
      child: Center(
        widthFactor: 1,
        heightFactor: 1,
        child: Text(
          value,
          style: AppTextStyles.caption.copyWith(
            color: textColor ?? theme.textPrimary,
            fontSize: fontSize ?? 11,
            fontWeight: isBold == true ? FontWeight.bold : null,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
