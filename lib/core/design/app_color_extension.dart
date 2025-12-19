import 'package:flutter/material.dart';

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primaryDark;
  final Color success;
  final Color warning;
  final Color info;
  final Color backgroundLight;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color sidebarBackground;
  final Color sidebarActiveBg;
  final Color sidebarActiveText;
  final Color sidebarActiveIcon;
  final Color sidebarInactiveText;

  const AppColorExtension({
    required this.primaryDark,
    required this.success,
    required this.warning,
    required this.info,
    required this.backgroundLight,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.sidebarBackground,
    required this.sidebarActiveBg,
    required this.sidebarActiveText,
    required this.sidebarActiveIcon,
    required this.sidebarInactiveText,
  });

  /// Удобный способ получения цветов в любом виджете
  static AppColorExtension of(BuildContext context) {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  @override
  AppColorExtension copyWith({
    Color? primaryDark,
    Color? success,
    Color? warning,
    Color? info,
    Color? backgroundLight,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? sidebarBackground,
    Color? sidebarActiveBg,
    Color? sidebarActiveText,
    Color? sidebarActiveIcon,
    Color? sidebarInactiveText,
  }) => AppColorExtension(
    primaryDark: primaryDark ?? this.primaryDark,
    success: success ?? this.success,
    warning: warning ?? this.warning,
    info: info ?? this.info,
    backgroundLight: backgroundLight ?? this.backgroundLight,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    textDisabled: textDisabled ?? this.textDisabled,
    sidebarBackground: sidebarBackground ?? this.sidebarBackground,
    sidebarActiveBg: sidebarActiveBg ?? this.sidebarActiveBg,
    sidebarActiveText: sidebarActiveText ?? this.sidebarActiveText,
    sidebarActiveIcon: sidebarActiveIcon ?? this.sidebarActiveIcon,
    sidebarInactiveText: sidebarInactiveText ?? this.sidebarInactiveText,
  );

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
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
    );
  }
}
