import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const MobileAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h3.copyWith(
          color: theme.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: theme.white,
      foregroundColor: theme.textPrimary,
      actions: actions,
      shape: Border(
        bottom: BorderSide(
          color: theme.textDisabled.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
