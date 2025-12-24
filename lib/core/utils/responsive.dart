import 'package:erpmax_client/core/theme/app_design.dart';
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
      MediaQuery.sizeOf(context).width < AppDesign.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppDesign.mobileBreakpoint &&
      MediaQuery.sizeOf(context).width < AppDesign.desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppDesign.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= AppDesign.desktopBreakpoint) {
      return desktop;
    }
    if (width >= AppDesign.mobileBreakpoint && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
