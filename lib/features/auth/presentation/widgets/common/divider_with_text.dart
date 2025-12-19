import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';

// РАЗДЕЛИТЕЛЬ "OR"
class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.gray200)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDesign.elementGap),
          child: Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.gray400),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.gray200)),
      ],
    );
  }
}

// КНОПКИ СОЦСЕТЕЙ
class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SocialAuthButton(
            iconPath: 'assets/svg/google.svg',
            text: 'Google',
            onPressed: () {},
          ),
        ),
        const SizedBox(width: AppDesign.elementGap),
        Expanded(
          child: _SocialAuthButton(
            iconPath: 'assets/svg/apple.svg',
            text: 'Apple',
            iconColor: AppColors.black,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _SocialAuthButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;
  final Color? iconColor;

  const _SocialAuthButton({
    required this.iconPath,
    required this.text,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: AppColors.gray200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
        ),
        // Эффект нажатия
        foregroundColor: AppColors.primary.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 20,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyles.base.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}