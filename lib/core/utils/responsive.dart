import 'package:erpmax_client/core/constants/breakpoints.dart';
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
      MediaQuery.sizeOf(context).width < Breakpoint.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= Breakpoint.mobileBreakpoint &&
      MediaQuery.sizeOf(context).width < Breakpoint.desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= Breakpoint.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= Breakpoint.desktopBreakpoint) {
      return desktop;
    }
    if (width >= Breakpoint.mobileBreakpoint && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
