import 'package:flutter/material.dart';

abstract final class AppDimens {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1100;
  static const int authBannerFlex = 6;
  static const int authFormFlex = 5;
  static const double maxFormWidth = 440;
  static const double sidebarExpandedWidth = 260;
  static const double sidebarCollapsedWidth = 80;
  static const double headerHeight = 64;
  static const double topTabHeight = 48;
  static const double cardRadius12 = 12;
  static const double inputRadius8 = 8;
  static const double buttonRadius = 8;
  static const double chipRadius6 = 6;
  static const double modalRadius = 16;
  static const double pagePadding = 24;
  static const double padding12 = 12;
  static const double rowWrapSpacing8 = 8;
  static const double formInnerPadding = 40;
  static const double elementGap = 16;
  static const double sectionGap = 32;
  static const double filterSpacing = 12;
  static const double tableHeaderHeight = 48;
  static const double tableRowHeight = 56;
  static const double iconSize = 20;
  static const double avatarSizeSmall = 32;
  static const double avatarSizeMed = 40;
  static const Duration sidebarDuration = Duration(milliseconds: 300);
  static const Duration fastDuration = Duration(milliseconds: 200);
  static const Curve defaultCurve = Curves.easeInOutCubic;
}

abstract final class AppBreakpoints {
  static const double mobile = AppDimens.mobileBreakpoint;
  static const double tablet = AppDimens.tabletBreakpoint;
  static const double desktop = AppDimens.desktopBreakpoint;

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
