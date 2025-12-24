// import 'package:flutter/material.dart';
// import '../design/app_colors.dart';
// import '../design/app_design.dart';
// import '../design/app_text_styles.dart';
// import '../design/app_color_extension.dart';

// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       fontFamily: AppTextStyles.fontFamily,
//       scaffoldBackgroundColor: AppColors.gray50,
//       colorScheme: const ColorScheme.light(
//         primary: AppColors.primary,
//         onPrimary: AppColors.white,
//         primaryContainer: AppColors.primaryDark,
//         secondary: AppColors.success,
//         onSecondary: AppColors.white,
//         error: AppColors.error,
//         surface: AppColors.white,
//         onSurface: AppColors.textPrimary,
//         outline: AppColors.gray300,
//         surfaceContainerHighest: AppColors.gray100,
//       ),
//       extensions: const [
//         AppColorExtension(
//           primaryDark: AppColors.primaryDark,
//           success: AppColors.success,
//           warning: AppColors.warning,
//           info: AppColors.info,
//           backgroundLight: AppColors.gray50,
//           textPrimary: AppColors.textPrimary,
//           textSecondary: AppColors.textSecondary,
//           textDisabled: AppColors.textDisabled,
//           sidebarBackground: AppColors.sidebarBackground,
//           sidebarActiveBg: AppColors.sidebarActiveBg,
//           sidebarActiveText: AppColors.sidebarActiveText,
//           sidebarActiveIcon: AppColors.sidebarActiveIcon,
//           sidebarInactiveText: AppColors.sidebarInactiveText,
//         ),
//       ],
//       dividerTheme: const DividerThemeData(
//         color: AppColors.gray200,
//         thickness: 1,
//         space: 1,
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         centerTitle: false,
//         titleTextStyle: TextStyle(
//           color: AppColors.textPrimary,
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//       ),

//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//           textStyle: AppTextStyles.buttonText,
//         ),
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.white,
//         contentPadding: const EdgeInsets.all(16),
//         hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.gray400),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppDesign.inputRadius),
//           borderSide: const BorderSide(color: AppColors.gray300),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppDesign.inputRadius),
//           borderSide: const BorderSide(color: AppColors.gray200),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppDesign.inputRadius),
//           borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//         ),
//       ),

//       cardTheme: CardThemeData(
//         color: AppColors.white,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppDesign.cardRadius),
//           side: const BorderSide(color: AppColors.gray200),
//         ),
//       ),
//     );
//   }
// }

import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    extensions: [
      AppColorExtension(
        primary: const Color(0xFF1379F0),
        primaryDark: const Color(0xFF0C5EC9),
        primaryLight: const Color(0xFFE6F0FE),
        success: const Color(0xFF10B981),
        successLight: const Color(0xFFDCFCE7),
        error: const Color(0xFFF04438),
        errorLight: const Color(0xFFFEE4E2),
        warning: const Color(0xFFF79009),
        warningLight: const Color(0xFFFEF0C7),
        info: const Color(0xFF4B5563),
        white: const Color(0xFFFFFFFF),
        black: const Color(0xFF0C111D),
        gray50: const Color(0xFFF9FAFB),
        gray100: const Color(0xFFF2F4F7),
        gray200: const Color(0xFFEAECF0),
        gray300: const Color(0xFFD0D5DD),
        gray400: const Color(0xFF98A2B3),
        gray500: const Color(0xFF667085),
        gray600: const Color(0xFF475467),
        gray700: const Color(0xFF344054),
        gray800: const Color(0xFF1D2939),
        gray900: const Color(0xFF101828),
        textPrimary: const Color(0xFF101828), // gray900
        textSecondary: const Color(0xFF475467), // gray600
        textTertiary: const Color(0xFF667085), // gray500
        textDisabled: const Color(0xFF98A2B3), // gray400
        textWhite: const Color(0xFFFFFFFF), // white
        borderLight: const Color(0xFFEAECF0), // gray200
        borderMedium: const Color(0xFFD0D5DD), // gray300
        shadowColor: const Color(0x0D101828),
        border: const Color(0xFFE2E8F0),
        sidebarBackground: const Color(0xFF101828), // gray900
        sidebarActiveBg: const Color(0xFF1D2939),
        sidebarActiveText: const Color(0xFFFFFFFF), // white
        sidebarActiveIcon: const Color(0xFF10B981), // success
        sidebarInactiveText: const Color(0xFF98A2B3), // gray400
        bgLight: const Color(0xFFF8FAFC),
        activeGreen: const Color(0xFF00C58D),
        inactiveBg: const Color(0xFFF1F5F9),
        successBg: const Color(0xFFECFDF3),
        successText: const Color(0xFF027A48),
        warningBg: const Color(0xFFFFFAEB),
        warningText: const Color(0xFFB54708),
        errorBg: const Color(0xFFFEF3F2),
        errorText: const Color(0xFFB42318),
        infoBg: const Color(0xFFEFF8FF),
        infoText: const Color(0xFF175CD3),
        neutralBg: const Color(0xFFF2F4F7),
        neutralText: const Color(0xFF344054),
        bgDisabled: const Color(0xFFF2F4F7), // (gray100)
        sidebarActiveBgBase: const Color(0xFF12203A),
        sidebarActiveBgLight: const Color(0xFF1A2D4D),
      ),
    ],
  );

  // ! Colors are currently the same for both themes
  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    extensions: [
      AppColorExtension(
        primary: const Color(0xFF1379F0),
        primaryDark: const Color(0xFF0C5EC9),
        primaryLight: const Color(0xFFE6F0FE),
        success: const Color(0xFF10B981),
        successLight: const Color(0xFFDCFCE7),
        error: const Color(0xFFF04438),
        errorLight: const Color(0xFFFEE4E2),
        warning: const Color(0xFFF79009),
        warningLight: const Color(0xFFFEF0C7),
        info: const Color(0xFF4B5563),
        white: const Color(0xFFFFFFFF),
        black: const Color(0xFF0C111D),
        gray50: const Color(0xFFF9FAFB),
        gray100: const Color(0xFFF2F4F7),
        gray200: const Color(0xFFEAECF0),
        gray300: const Color(0xFFD0D5DD),
        gray400: const Color(0xFF98A2B3),
        gray500: const Color(0xFF667085),
        gray600: const Color(0xFF475467),
        gray700: const Color(0xFF344054),
        gray800: const Color(0xFF1D2939),
        gray900: const Color(0xFF101828),
        textPrimary: const Color(0xFF101828), // gray900
        textSecondary: const Color(0xFF475467), // gray600
        textTertiary: const Color(0xFF667085), // gray500
        textDisabled: const Color(0xFF98A2B3), // gray400
        textWhite: const Color(0xFFFFFFFF), // white
        borderLight: const Color(0xFFEAECF0), // gray200
        borderMedium: const Color(0xFFD0D5DD), // gray300
        shadowColor: const Color(0x0D101828),
        border: const Color(0xFFE2E8F0),
        sidebarBackground: const Color(0xFF101828), // gray900
        sidebarActiveBg: const Color(0xFF1D2939),
        sidebarActiveText: const Color(0xFFFFFFFF), // white
        sidebarActiveIcon: const Color(0xFF10B981), // success
        sidebarInactiveText: const Color(0xFF98A2B3), // gray400
        bgLight: const Color(0xFFF8FAFC),
        activeGreen: const Color(0xFF00C58D),
        inactiveBg: const Color(0xFFF1F5F9),
        successBg: const Color(0xFFECFDF3),
        successText: const Color(0xFF027A48),
        warningBg: const Color(0xFFFFFAEB),
        warningText: const Color(0xFFB54708),
        errorBg: const Color(0xFFFEF3F2),
        errorText: const Color(0xFFB42318),
        infoBg: const Color(0xFFEFF8FF),
        infoText: const Color(0xFF175CD3),
        neutralBg: const Color(0xFFF2F4F7),
        neutralText: const Color(0xFF344054),
        bgDisabled: const Color(0xFFF2F4F7), // (gray100)
        sidebarActiveBgBase: const Color(0xFF0A121E),
        sidebarActiveBgLight: const Color(0xFF14223A),
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
