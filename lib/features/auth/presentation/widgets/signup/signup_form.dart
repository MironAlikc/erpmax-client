import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/common/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;
  bool _isTermsAccepted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate() && _isTermsAccepted) {
      context.go(RouteNames.journal);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SignupHeader(),
          const SizedBox(height: Dimens.p32),

          const SocialAuthButtons(),
          const SizedBox(height: Dimens.p16),

          DividerWithText(text: localizations.or),
          const SizedBox(height: Dimens.p16),

          _FieldLabel(text: localizations.email),
          AppTextField(
            controller: _emailController,
            hintText: 'email@email.com',
            keyboardType: TextInputType.emailAddress,
            validator: (value) => (value == null || !value.contains('@'))
                ? localizations.invalidEmail
                : null,
          ),
          const SizedBox(height: Dimens.p16),

          _FieldLabel(text: localizations.password),
          AppTextField(
            controller: _passwordController,
            hintText: localizations.enterPassword,
            obscureText: !_isPasswordVisible,
            isPassword: true,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20,
                color: theme.gray400,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
          ),
          const SizedBox(height: Dimens.p16),

          _FieldLabel(text: localizations.confirmPassword),
          AppTextField(
            controller: _confirmPasswordController,
            hintText: localizations.reEnterPassword,
            obscureText: !_isConfirmVisible,
            isPassword: true,
            validator: (value) {
              if (value != _passwordController.text) {
                return localizations.passwordsDoNotMatch;
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20,
                color: theme.gray400,
              ),
              onPressed: () =>
                  setState(() => _isConfirmVisible = !_isConfirmVisible),
            ),
          ),
          const SizedBox(height: Dimens.p16),

          _TermsCheckbox(
            value: _isTermsAccepted,
            onChanged: (v) => setState(() => _isTermsAccepted = v ?? false),
          ),
          const SizedBox(height: Dimens.p32),

          AppButton(
            text: localizations.signUp,
            onPressed: _isTermsAccepted ? _handleSignup : null,
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          localizations.signUp,
          style: AppTextStyles.h1.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: theme.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.alreadyHaveAccount,
              style: AppTextStyles.bodySmall,
            ),
            GestureDetector(
              onTap: () => context.push(RouteNames.login),
              child: Text(
                localizations.signIn,
                style: AppTextStyles.link.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
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

class _TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  const _TermsCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: theme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(color: theme.gray300, width: 1.5),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppLocalizations.of(context).acceptTerms,
              style: AppTextStyles.bodySmall.copyWith(
                color: theme.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
