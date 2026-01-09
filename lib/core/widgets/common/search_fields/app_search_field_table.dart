import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppSearchFieldTable extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final double? width;
  final Color? hoverColor;

  const AppSearchFieldTable({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.width,
    this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      height: 40,
      width: width ?? double.infinity,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyles.bodyMedium.copyWith(color: theme.textPrimary),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText ?? AppLocalizations.of(context).search,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: theme.textSecondary,
          ),
          prefixIcon: Icon(
            LucideIcons.search,
            size: 18,
            color: theme.textSecondary,
          ),
          hoverColor: hoverColor ?? theme.gray50,
          contentPadding: EdgeInsets.zero,
          isDense: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.p8),
            borderSide: BorderSide(color: theme.border, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.p8),
            borderSide: BorderSide(color: theme.border, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.p8),
            borderSide: BorderSide(color: theme.textPrimary, width: 1),
          ),
          filled: true,
          fillColor: theme.white,
        ),
      ),
    );
  }
}
