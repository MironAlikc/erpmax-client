import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      width: 260,
      color: theme.sidebarBackground,
      child: Center(
        child: Text(
          'Sidebar',
          style: AppTextStyles.bodyMedium.copyWith(color: theme.textWhite),
        ),
      ),
    );
  }
}
