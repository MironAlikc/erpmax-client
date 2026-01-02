import 'package:flutter/material.dart';

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color primaryFooter;
  final Color success;
  final Color successLight;
  final Color error;
  final Color errorLight;
  final Color warning;
  final Color warningLight;
  final Color info;
  final Color white;
  final Color black;
  final Color gray50;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color gray900;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textWhite;
  final Color borderLight;
  final Color borderMedium;
  final Color shadowColor;
  final Color border;
  final Color sidebarBackground;
  final Color sidebarActiveBg;
  final Color sidebarActiveText;
  final Color sidebarActiveIcon;
  final Color sidebarInactiveText;
  final Color bgLight;
  final Color activeGreen;
  final Color inactiveBg;
  final Color successBg;
  final Color successText;
  final Color warningBg;
  final Color warningText;
  final Color errorBg;
  final Color errorText;
  final Color infoBg;
  final Color infoText;
  final Color neutralBg;
  final Color neutralText;
  final Color bgDisabled;
  final Color sidebarActiveBgBase;
  final Color sidebarActiveBgLight;
  final Color accentIndigo;
  final Color accentIndigoLight;
  final Color indigoBg;
  final Color indigoText;
  final Color violetBg;
  final Color violetText;
  final Color addButton;

  const AppColorExtension({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.primaryFooter,
    required this.success,
    required this.successLight,
    required this.error,
    required this.errorLight,
    required this.warning,
    required this.warningLight,
    required this.info,
    required this.white,
    required this.black,
    required this.gray50,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.gray600,
    required this.gray700,
    required this.gray800,
    required this.gray900,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textWhite,
    required this.borderLight,
    required this.borderMedium,
    required this.shadowColor,
    required this.border,
    required this.sidebarBackground,
    required this.sidebarActiveBg,
    required this.sidebarActiveText,
    required this.sidebarActiveIcon,
    required this.sidebarInactiveText,
    required this.bgLight,
    required this.activeGreen,
    required this.inactiveBg,
    required this.successBg,
    required this.successText,
    required this.warningBg,
    required this.warningText,
    required this.errorBg,
    required this.errorText,
    required this.infoBg,
    required this.infoText,
    required this.neutralBg,
    required this.neutralText,
    required this.bgDisabled,
    required this.sidebarActiveBgBase,
    required this.sidebarActiveBgLight,
    required this.accentIndigo,
    required this.accentIndigoLight,
    required this.indigoBg,
    required this.indigoText,
    required this.violetBg,
    required this.violetText,
    required this.addButton,
  });

  @override
  AppColorExtension copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? primaryFooter,
    Color? success,
    Color? successLight,
    Color? error,
    Color? errorLight,
    Color? warning,
    Color? warningLight,
    Color? info,
    Color? white,
    Color? black,
    Color? gray50,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? gray600,
    Color? gray700,
    Color? gray800,
    Color? gray900,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textWhite,
    Color? borderLight,
    Color? borderMedium,
    Color? shadowColor,
    Color? border,
    Color? sidebarBackground,
    Color? sidebarActiveBg,
    Color? sidebarActiveText,
    Color? sidebarActiveIcon,
    Color? sidebarInactiveText,
    Color? bgLight,
    Color? activeGreen,
    Color? inactiveBg,
    Color? successBg,
    Color? successText,
    Color? warningBg,
    Color? warningText,
    Color? errorBg,
    Color? errorText,
    Color? infoBg,
    Color? infoText,
    Color? neutralBg,
    Color? neutralText,
    Color? bgDisabled,
    Color? sidebarActiveBgBase,
    Color? sidebarActiveBgLight,
    Color? accentIndigo,
    Color? accentIndigoLight,
    Color? indigoBg,
    Color? indigoText,
    Color? violetBg,
    Color? violetText,
    Color? addButton,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryFooter: primaryFooter ?? this.primaryFooter,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      error: error ?? this.error,
      errorLight: errorLight ?? this.errorLight,
      warning: warning ?? this.warning,
      warningLight: warningLight ?? this.warningLight,
      info: info ?? this.info,
      white: white ?? this.white,
      black: black ?? this.black,
      gray50: gray50 ?? this.gray50,
      gray100: gray100 ?? this.gray100,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      gray600: gray600 ?? this.gray600,
      gray700: gray700 ?? this.gray700,
      gray800: gray800 ?? this.gray800,
      gray900: gray900 ?? this.gray900,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textWhite: textWhite ?? this.textWhite,
      borderLight: borderLight ?? this.borderLight,
      borderMedium: borderMedium ?? this.borderMedium,
      shadowColor: shadowColor ?? this.shadowColor,
      border: border ?? this.border,
      sidebarBackground: sidebarBackground ?? this.sidebarBackground,
      sidebarActiveBg: sidebarActiveBg ?? this.sidebarActiveBg,
      sidebarActiveText: sidebarActiveText ?? this.sidebarActiveText,
      sidebarActiveIcon: sidebarActiveIcon ?? this.sidebarActiveIcon,
      sidebarInactiveText: sidebarInactiveText ?? this.sidebarInactiveText,
      bgLight: bgLight ?? this.bgLight,
      activeGreen: activeGreen ?? this.activeGreen,
      inactiveBg: inactiveBg ?? this.inactiveBg,
      successBg: successBg ?? this.successBg,
      successText: successText ?? this.successText,
      warningBg: warningBg ?? this.warningBg,
      warningText: warningText ?? this.warningText,
      errorBg: errorBg ?? this.errorBg,
      errorText: errorText ?? this.errorText,
      infoBg: infoBg ?? this.infoBg,
      infoText: infoText ?? this.infoText,
      neutralBg: neutralBg ?? this.neutralBg,
      neutralText: neutralText ?? this.neutralText,
      bgDisabled: bgDisabled ?? this.bgDisabled,
      sidebarActiveBgBase: sidebarActiveBgBase ?? this.sidebarActiveBgBase,
      sidebarActiveBgLight: sidebarActiveBgLight ?? this.sidebarActiveBgLight,
      accentIndigo: accentIndigo ?? this.accentIndigo,
      accentIndigoLight: accentIndigoLight ?? this.accentIndigoLight,
      indigoBg: indigoBg ?? this.indigoBg,
      indigoText: indigoText ?? this.indigoText,
      violetBg: violetBg ?? this.violetBg,
      violetText: violetText ?? this.violetText,
      addButton: addButton ?? this.addButton,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryFooter: Color.lerp(primaryFooter, other.primaryFooter, t)!,
      success: Color.lerp(success, other.success, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      info: Color.lerp(info, other.info, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      gray50: Color.lerp(gray50, other.gray50, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      gray900: Color.lerp(gray900, other.gray900, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textWhite: Color.lerp(textWhite, other.textWhite, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      borderMedium: Color.lerp(borderMedium, other.borderMedium, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      border: Color.lerp(border, other.border, t)!,
      sidebarBackground: Color.lerp(
        sidebarBackground,
        other.sidebarBackground,
        t,
      )!,
      sidebarActiveBg: Color.lerp(sidebarActiveBg, other.sidebarActiveBg, t)!,
      sidebarActiveText: Color.lerp(
        sidebarActiveText,
        other.sidebarActiveText,
        t,
      )!,
      sidebarActiveIcon: Color.lerp(
        sidebarActiveIcon,
        other.sidebarActiveIcon,
        t,
      )!,
      sidebarInactiveText: Color.lerp(
        sidebarInactiveText,
        other.sidebarInactiveText,
        t,
      )!,
      bgLight: Color.lerp(bgLight, other.bgLight, t)!,
      activeGreen: Color.lerp(activeGreen, other.activeGreen, t)!,
      inactiveBg: Color.lerp(inactiveBg, other.inactiveBg, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      warningText: Color.lerp(warningText, other.warningText, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      errorText: Color.lerp(errorText, other.errorText, t)!,
      infoBg: Color.lerp(infoBg, other.infoBg, t)!,
      infoText: Color.lerp(infoText, other.infoText, t)!,
      neutralBg: Color.lerp(neutralBg, other.neutralBg, t)!,
      neutralText: Color.lerp(neutralText, other.neutralText, t)!,
      bgDisabled: Color.lerp(bgDisabled, other.bgDisabled, t)!,
      sidebarActiveBgBase: Color.lerp(
        sidebarActiveBgBase,
        other.sidebarActiveBgBase,
        t,
      )!,
      sidebarActiveBgLight: Color.lerp(
        sidebarActiveBgLight,
        other.sidebarActiveBgLight,
        t,
      )!,
      accentIndigo: Color.lerp(accentIndigo, other.accentIndigo, t)!,
      accentIndigoLight: Color.lerp(
        accentIndigoLight,
        other.accentIndigoLight,
        t,
      )!,
      indigoBg: Color.lerp(indigoBg, other.indigoBg, t)!,
      indigoText: Color.lerp(indigoText, other.indigoText, t)!,
      violetBg: Color.lerp(violetBg, other.violetBg, t)!,
      violetText: Color.lerp(violetText, other.violetText, t)!,
      addButton: Color.lerp(addButton, other.addButton, t)!,
    );
  }
}
