import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/common/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;
  bool _remember = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        context.go(RouteNames.journal);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _FormHeader(),
          const SizedBox(height: AppDimens.sectionGap),

          const SocialAuthButtons(),
          const SizedBox(height: AppDimens.elementGap),

          DividerWithText(text: localizations.or),
          const SizedBox(height: AppDimens.elementGap),

          AppTextField(
            controller: _emailController,
            label: localizations.email,
            hintText: 'example@company.com',
            keyboardType: TextInputType.emailAddress,
            enabled: !_isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.errorEnterEmail;
              }

              if (!value.contains('@')) {
                return localizations.errorInvalidEmail;
              }

              return null;
            },
          ),
          const SizedBox(height: AppDimens.elementGap),

          _PasswordField(
            controller: _passwordController,
            isObscured: _obscure,
            onToggle: () => setState(() => _obscure = !_obscure),
            enabled: !_isLoading,
          ),

          _RememberMeRow(
            value: _remember,
            onChanged: _isLoading
                ? null
                : (val) => setState(() => _remember = val ?? false),
          ),

          const SizedBox(height: AppDimens.sectionGap),

          AppButton(
            text: localizations.signIn,
            isExpanded: true,
            isLoading: _isLoading,
            onPressed: _isLoading ? null : _handleSignIn,
          ),
        ],
      ),
    );
  }
}

class _FormHeader extends StatelessWidget {
  const _FormHeader();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          'Sign in',
          style: AppTextStyles.h1.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: context.theme.appColor.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.dontHaveAccount, style: AppTextStyles.bodySmall),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => context.push(RouteNames.signup),
              child: Text(
                localizations.signUp,
                style: AppTextStyles.link.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscured;
  final VoidCallback onToggle;
  final bool enabled;

  const _PasswordField({
    required this.controller,
    required this.isObscured,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: AppTextStyles.base.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.gray900,
              ),
            ),
            GestureDetector(
              onTap: enabled
                  ? () => context.push(RouteNames.forgotPassword)
                  : null,
              child: Text(
                'Forgot?',
                style: AppTextStyles.link.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: controller,
          hintText: '••••••••',
          obscureText: isObscured,
          enabled: enabled,
          validator: (value) => (value != null && value.length >= 6)
              ? null
              : AppLocalizations.of(context).errorMinLength,
          suffixIcon: IconButton(
            icon: Icon(
              isObscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 20,
              color: theme.gray400,
            ),
            onPressed: onToggle,
          ),
        ),
      ],
    );
  }
}

class _RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const _RememberMeRow({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: onChanged != null ? () => onChanged!(!value) : null,
        borderRadius: BorderRadius.circular(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
            Text(
              AppLocalizations.of(context).rememberMe,
              style: AppTextStyles.bodySmall.copyWith(
                color: theme.gray600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
