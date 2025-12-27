import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    extensions: [
      AppColorExtension(
        // Основные цвета из секции Primary и Erp Navy
        primary: const Color(0xFF0F172A), // Primary Default
        primaryDark: const Color(0xFF0A2540), // Erp Navy
        primaryLight: const Color(0xFFF1F5F9), // Accent/Secondary Default
        // Семантические цвета из секции Erp и Destructive
        success: const Color(0xFF10B981), // Erp Success
        successLight: const Color(0xFFD1FAE5), // (Расчетный светлый тон)
        error: const Color(0xFFEF4444), // Erp Error / Destructive Default
        errorLight: const Color(0xFFFEE2E2), // (Расчетный светлый тон)
        warning: const Color(0xFFF59E0B), // Erp Warning
        warningLight: const Color(0xFFFEF3C7), // (Расчетный светлый тон)

        info: const Color(0xFF0A2540), // Navy
        white: const Color(0xFFFFFFFF), // Background / Card Default
        black: const Color(0xFF020817), // Foreground
        // Градация серого (на основе Border, Muted и Accent)
        gray50: const Color(0xFFFAF9F6), // Erp Cream
        gray100: const Color(0xFFF1F5F9), // Accent/Muted Default
        gray200: const Color(0xFFE2E8F0), // Border / Input
        gray300: const Color(0xFFCBD5E1), // (Промежуточный)
        gray400: const Color(0xFF94A3B8), // (Промежуточный)
        gray500: const Color(0xFF64748B), // Muted Foreground
        gray600: const Color(0xFF475467),
        gray700: const Color(0xFF334155),
        gray800: const Color(0xFF1E293B),
        gray900: const Color(0xFF0F172A), // Primary Default
        // Текст
        textPrimary: const Color(0xFF020817), // Foreground
        textSecondary: const Color(0xFF64748B), // Muted Foreground
        textTertiary: const Color(0xFF0F172A), // Accent Foreground
        textDisabled: const Color(0xFF94A3B8),
        textWhite: const Color(0xFFF8FAFC), // Primary/Destructive Foreground
        // Границы и тени
        borderLight: const Color(0xFFE2E8F0), // Border
        borderMedium: const Color(0xFFCBD5E1),
        shadowColor: const Color(0x0D020817),
        border: const Color(0xFFE2E8F0), // Input / Border
        // Сайдбар (используем Navy для контраста, как в Tempo ERP)
        sidebarBackground: const Color(0xFF0A2540), // Erp Navy
        sidebarActiveBg: const Color(0xFF0F172A),
        sidebarActiveText: const Color(0xFFFFFFFF),
        sidebarActiveIcon: const Color(0xFF00D4AA), // Erp Teal
        sidebarInactiveText: const Color(0xFF64748B),

        // Фоны и статусы
        bgLight: const Color(0xFFFFFFFF), // Background
        activeGreen: const Color(0xFF00D4AA), // Erp Teal
        inactiveBg: const Color(0xFFF1F5F9), // Muted Default
        successBg: const Color(0xFFD1FAE5),
        successText: const Color(0xFF065F46),
        warningBg: const Color(0xFFFEF3C7),
        warningText: const Color(0xFF92400E),
        errorBg: const Color(0xFFFEE2E2),
        errorText: const Color(0xFF991B1B),
        infoBg: const Color(0xFFE0F2FE),
        infoText: const Color(0xFF075985),
        neutralBg: const Color(0xFFF1F5F9),
        neutralText: const Color(0xFF334155),
        bgDisabled: const Color(0xFFF1F5F9),

        // Дополнительные акценты
        sidebarActiveBgBase: const Color(0xFF0F172A),
        sidebarActiveBgLight: const Color(0xFF1E293B),
        accentIndigo: const Color(0xFF6366F1),
        accentIndigoLight: const Color(0xFFEEF2FF),
        indigoBg: const Color(0xFFEEF2FF),
        indigoText: const Color(0xFF4F46E5),
        violetBg: const Color(0xFFF5F3FF),
        violetText: const Color(0xFF7C3AED),
      ),
    ],
  );

  // ! Colors are currently the same for both themes
  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    extensions: [
      AppColorExtension(
        // Основные цвета из секции Primary и Erp Navy
        primary: const Color(0xFF0F172A), // Primary Default
        primaryDark: const Color(0xFF0A2540), // Erp Navy
        primaryLight: const Color(0xFFF1F5F9), // Accent/Secondary Default
        // Семантические цвета из секции Erp и Destructive
        success: const Color(0xFF10B981), // Erp Success
        successLight: const Color(0xFFD1FAE5), // (Расчетный светлый тон)
        error: const Color(0xFFEF4444), // Erp Error / Destructive Default
        errorLight: const Color(0xFFFEE2E2), // (Расчетный светлый тон)
        warning: const Color(0xFFF59E0B), // Erp Warning
        warningLight: const Color(0xFFFEF3C7), // (Расчетный светлый тон)

        info: const Color(0xFF0A2540), // Navy
        white: const Color(0xFFFFFFFF), // Background / Card Default
        black: const Color(0xFF020817), // Foreground
        // Градация серого (на основе Border, Muted и Accent)
        gray50: const Color(0xFFFAF9F6), // Erp Cream
        gray100: const Color(0xFFF1F5F9), // Accent/Muted Default
        gray200: const Color(0xFFE2E8F0), // Border / Input
        gray300: const Color(0xFFCBD5E1), // (Промежуточный)
        gray400: const Color(0xFF94A3B8), // (Промежуточный)
        gray500: const Color(0xFF64748B), // Muted Foreground
        gray600: const Color(0xFF475467),
        gray700: const Color(0xFF334155),
        gray800: const Color(0xFF1E293B),
        gray900: const Color(0xFF0F172A), // Primary Default
        // Текст
        textPrimary: const Color(0xFF020817), // Foreground
        textSecondary: const Color(0xFF64748B), // Muted Foreground
        textTertiary: const Color(0xFF0F172A), // Accent Foreground
        textDisabled: const Color(0xFF94A3B8),
        textWhite: const Color(0xFFF8FAFC), // Primary/Destructive Foreground
        // Границы и тени
        borderLight: const Color(0xFFE2E8F0), // Border
        borderMedium: const Color(0xFFCBD5E1),
        shadowColor: const Color(0x0D020817),
        border: const Color(0xFFE2E8F0), // Input / Border
        // Сайдбар (используем Navy для контраста, как в Tempo ERP)
        sidebarBackground: const Color(0xFF0A2540), // Erp Navy
        sidebarActiveBg: const Color(0xFF0F172A),
        sidebarActiveText: const Color(0xFFFFFFFF),
        sidebarActiveIcon: const Color(0xFF00D4AA), // Erp Teal
        sidebarInactiveText: const Color(0xFF64748B),

        // Фоны и статусы
        bgLight: const Color(0xFFFFFFFF), // Background
        activeGreen: const Color(0xFF00D4AA), // Erp Teal
        inactiveBg: const Color(0xFFF1F5F9), // Muted Default
        successBg: const Color(0xFFD1FAE5),
        successText: const Color(0xFF065F46),
        warningBg: const Color(0xFFFEF3C7),
        warningText: const Color(0xFF92400E),
        errorBg: const Color(0xFFFEE2E2),
        errorText: const Color(0xFF991B1B),
        infoBg: const Color(0xFFE0F2FE),
        infoText: const Color(0xFF075985),
        neutralBg: const Color(0xFFF1F5F9),
        neutralText: const Color(0xFF334155),
        bgDisabled: const Color(0xFFF1F5F9),

        // Дополнительные акценты
        sidebarActiveBgBase: const Color(0xFF0F172A),
        sidebarActiveBgLight: const Color(0xFF1E293B),
        accentIndigo: const Color(0xFF6366F1),
        accentIndigoLight: const Color(0xFFEEF2FF),
        indigoBg: const Color(0xFFEEF2FF),
        indigoText: const Color(0xFF4F46E5),
        violetBg: const Color(0xFFF5F3FF),
        violetText: const Color(0xFF7C3AED),
      ),
    ],
  );
}

extension AppThemeExtension on ThemeData {
  AppColorExtension get appColor {
    final extensionValue = extension<AppColorExtension>();
    assert(
      extensionValue != null,
      'AppColorExtension is not found in ThemeData',
    );
    return extensionValue!;
  }
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
