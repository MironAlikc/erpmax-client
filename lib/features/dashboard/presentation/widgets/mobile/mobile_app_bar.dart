import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const MobileAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colors.textPrimary,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: colors.textPrimary,
      actions: actions,
      shape: Border(
        bottom: BorderSide(
          color: colors.textDisabled.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
