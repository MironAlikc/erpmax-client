import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const String fontFamily = 'Inter';

  static const TextStyle base = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle h1 = base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static final TextStyle h2 = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static final TextStyle h3 = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle h4 = base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle h5 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle bodyLarge = base.copyWith(fontSize: 16, height: 1.5);

  static final TextStyle bodyLargeBold = bodyLarge.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyMedium = base.copyWith(fontSize: 14, height: 1.5);

  static final TextStyle bodyMediumBold = bodyMedium.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodySmall = base.copyWith(fontSize: 12, height: 1.5);

  static final TextStyle bodySmallBold = bodySmall.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle button = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.0,
  );

  static final TextStyle buttonLarge = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.0,
  );

  static final TextStyle link = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    height: 1.5,
  );

  static final TextStyle label = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.3,
  );

  static final TextStyle caption = base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  static final TextStyle overline = base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.3,
  );

  static final TextStyle tableHeader = base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    height: 1.3,
  );

  static final TextStyle sidebarItem = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static final TextStyle sidebarItemActive = sidebarItem.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bannerTitle = base.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    height: 1.1,
  );
}
