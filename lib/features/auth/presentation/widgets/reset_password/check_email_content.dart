import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CheckEmailContent extends StatelessWidget {
  final String email;
  final VoidCallback? onResend;

  const CheckEmailContent({required this.email, this.onResend, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/reminder.svg', height: 140),
        const SizedBox(height: 32),
        Text(
          'Check your email',
          style: AppTextStyles.h1.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: theme.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.gray600,
              fontSize: 14,
              height: 1.5,
            ),
            children: [
              const TextSpan(text: 'Please click the link sent to your email '),
              TextSpan(
                text: email,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.black,
                ),
              ),
              const TextSpan(text: ' to verify your account. Thank you'),
            ],
          ),
        ),
        const SizedBox(height: 32),
        AppButton(
          text: 'Back to Home',
          isExpanded: true,
          onPressed: () => context.go(RouteNames.login),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't receive an email? ",
              style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
            ),
            GestureDetector(
              onTap: onResend,
              child: Text(
                'Resend',
                style: AppTextStyles.linkStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
