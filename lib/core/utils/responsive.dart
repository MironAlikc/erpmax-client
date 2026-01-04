import 'package:erpmax_client/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < AppDimens.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppDimens.mobileBreakpoint &&
      MediaQuery.sizeOf(context).width < AppDimens.desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppDimens.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= AppDimens.desktopBreakpoint) {
      return desktop;
    }
    if (width >= AppDimens.mobileBreakpoint && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
