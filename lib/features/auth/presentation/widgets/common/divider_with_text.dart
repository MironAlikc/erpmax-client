import 'package:erpmax_client/core/theme/app_dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Row(
      children: [
        Expanded(child: Divider(color: theme.gray200)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.elementGap),
          child: Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(color: theme.gray400),
          ),
        ),
        Expanded(child: Divider(color: theme.gray200)),
      ],
    );
  }
}

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
        const SizedBox(width: AppDimens.elementGap),
        Expanded(
          child: _SocialAuthButton(
            iconPath: 'assets/svg/apple.svg',
            text: 'Apple',
            iconColor: context.theme.appColor.black,
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
    final theme = context.theme.appColor;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: theme.gray200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
        ),
        foregroundColor: theme.primary.withValues(alpha: 0.1),
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
              color: theme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
