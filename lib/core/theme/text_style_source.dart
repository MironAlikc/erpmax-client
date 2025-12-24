import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const String fontFamily = 'Inter';

  static const TextStyle base = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.2,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle h1 = base.copyWith(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static final TextStyle h2 = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static final TextStyle h3 = base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyLarge = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final TextStyle bodyMedium = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static final TextStyle bodyMediumBold = bodyMedium.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodySmall = base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  static final TextStyle bodySmallBold = bodySmall.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle buttonText = base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static final TextStyle linkStyle = base.copyWith(
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );

  static final TextStyle labelStyle = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle tableHeader = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static final TextStyle bannerTitle = base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    height: 1.1,
  );

  static final TextStyle sidebarInactive = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle sidebarActive = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
