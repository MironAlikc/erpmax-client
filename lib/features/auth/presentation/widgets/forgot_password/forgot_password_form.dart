// lib/features/auth/presentation/widgets/forgot_password/forgot_password_form.dart
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Forgot Password?',
          style: AppTextStyles.h1.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your email to reset password',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDesign.sectionGap),

        const _FieldLabel(text: 'Email'),
        const AppTextField(
          hintText: 'email@email.com',
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: AppDesign.sectionGap),

        AppButton(
          onPressed: () => context.push(RouteNames.checkEmail),
          text: 'Continue',
          isExpanded: true,
        ),

        const SizedBox(height: 16),
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Back to Sign In',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

// Дублируем локальный хелпер лейбла для независимости файла
class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppTextStyles.base.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.gray900,
          fontSize: 14,
        ),
      ),
    );
  }
}
