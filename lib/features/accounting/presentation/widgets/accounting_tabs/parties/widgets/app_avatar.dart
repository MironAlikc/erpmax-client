import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String initials;
  final Color? backgroundColor;
  final double radius;

  const AppAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
    this.backgroundColor,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(color: theme.gray400, shape: BoxShape.circle),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? theme.sidebarBackground,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null
            ? Text(
                initials,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: theme.textWhite,
                  fontSize: radius * 0.8,
                ),
              )
            : null,
      ),
    );
  }
}
