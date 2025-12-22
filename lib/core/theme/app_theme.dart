import 'package:flutter/material.dart';
import '../design/app_colors.dart';
import '../design/app_design.dart';
import '../design/app_text_styles.dart';
import '../design/app_color_extension.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTextStyles.fontFamily,
      scaffoldBackgroundColor: AppColors.gray50,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.success,
        onSecondary: AppColors.white,
        error: AppColors.error,
        surface: AppColors.white,
        onSurface: AppColors.textPrimary,
        outline: AppColors.gray300,
        surfaceContainerHighest: AppColors.gray100,
      ),
      extensions: const [
        AppColorExtension(
          primaryDark: AppColors.primaryDark,
          success: AppColors.success,
          warning: AppColors.warning,
          info: AppColors.info,
          backgroundLight: AppColors.gray50,
          textPrimary: AppColors.textPrimary,
          textSecondary: AppColors.textSecondary,
          textDisabled: AppColors.textDisabled,
          sidebarBackground: AppColors.sidebarBackground,
          sidebarActiveBg: AppColors.sidebarActiveBg,
          sidebarActiveText: AppColors.sidebarActiveText,
          sidebarActiveIcon: AppColors.sidebarActiveIcon,
          sidebarInactiveText: AppColors.sidebarInactiveText,
        ),
      ],
      dividerTheme: const DividerThemeData(
        color: AppColors.gray200,
        thickness: 1,
        space: 1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: AppTextStyles.buttonText,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.gray400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.inputRadius),
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.inputRadius),
          borderSide: const BorderSide(color: AppColors.gray200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.inputRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.cardRadius),
          side: const BorderSide(color: AppColors.gray200),
        ),
      ),
    );
  }
}
