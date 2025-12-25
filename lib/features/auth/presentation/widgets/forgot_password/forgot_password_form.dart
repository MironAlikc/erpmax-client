import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          localizations.forgotPassword,
          style: AppTextStyles.h1.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: theme.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          localizations.enterEmailToReset,
          style: AppTextStyles.bodySmall.copyWith(color: theme.textSecondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDesign.sectionGap),

        _FieldLabel(text: localizations.email),
        const AppTextField(
          hintText: 'email@email.com',
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: AppDesign.sectionGap),

        AppButton(
          onPressed: () => context.push(RouteNames.checkEmail),
          text: localizations.continueBtn,
          isExpanded: true,
        ),

        const SizedBox(height: 16),
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            localizations.backToSignIn,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

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
          color: context.theme.appColor.gray900,
          fontSize: 14,
        ),
      ),
    );
  }
}
