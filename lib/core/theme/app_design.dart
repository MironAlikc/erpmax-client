import 'package:flutter/material.dart';

abstract final class AppDesign {
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1100.0;
  static const int authBannerFlex = 6;
  static const int authFormFlex = 5;
  static const double maxFormWidth = 440.0;
  static const double sidebarExpandedWidth = 260.0;
  static const double sidebarCollapsedWidth = 80.0;
  static const double headerHeight = 64.0;
  static const double topTabHeight = 48.0;
  static const double cardRadius = 12.0;
  static const double inputRadius = 8.0;
  static const double buttonRadius = 8.0;
  static const double chipRadius = 6.0;
  static const double modalRadius = 16.0;
  static const double pagePadding = 24.0;
  static const double formInnerPadding = 40.0;
  static const double elementGap = 16.0;
  static const double sectionGap = 32.0;
  static const double filterSpacing = 12.0;
  static const double tableHeaderHeight = 48.0;
  static const double tableRowHeight = 56.0;
  static const double iconSize = 20.0;
  static const double avatarSizeSmall = 32.0;
  static const double avatarSizeMed = 40.0;
  static const Duration sidebarDuration = Duration(milliseconds: 300);
  static const Duration fastDuration = Duration(milliseconds: 200);
  static const Curve defaultCurve = Curves.easeInOutCubic;
}

abstract final class AppBreakpoints {
  static const double mobile = AppDesign.mobileBreakpoint;
  static const double tablet = AppDesign.tabletBreakpoint;
  static const double desktop = AppDesign.desktopBreakpoint;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobile &&
      MediaQuery.sizeOf(context).width < desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;
}

extension ResponsiveContext on BuildContext {
  bool get isMobile => AppBreakpoints.isMobile(this);
  bool get isTablet => AppBreakpoints.isTablet(this);
  bool get isDesktop => AppBreakpoints.isDesktop(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}
