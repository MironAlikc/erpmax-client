import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/app_design.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;

  const AppCard({
    required this.child,
    this.padding,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: padding ?? const EdgeInsets.all(AppDesign.elementGap),
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: theme.borderLight),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
