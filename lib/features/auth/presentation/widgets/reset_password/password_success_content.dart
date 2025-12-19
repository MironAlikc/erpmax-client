import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PasswordSuccessContent extends StatelessWidget {
  const PasswordSuccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset('assets/svg/success_illustration.svg', height: 150),
        const SizedBox(height: 32),
        Text(
          'Your password is changed',
          textAlign: TextAlign.center,
          style: AppTextStyles.h1.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Your password has been successfully updated.\nYour account security is our priority.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.gray500,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        AppButton(
          onPressed: () => context.go(RouteNames.login),
          text: 'Sign In',
          isExpanded: true,
        ),
      ],
    );
  }
}
