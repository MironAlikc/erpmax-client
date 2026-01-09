import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/router/app_router.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:erpmax_client/core/widgets/common/buttons/app_button.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/common/divider_with_text.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_event.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _fullNameController = TextEditingController();
  final _companyNameController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;
  bool _isTermsAccepted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate() && _isTermsAccepted) {
      context.read<AuthBloc>().add(
        AuthEvent.registerRequested(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          fullName: _fullNameController.text.trim(),
          companyName: _companyNameController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: context.theme.appColor.error,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

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

              _FieldLabel(text: 'Full Name'),
              AppTextField(
                controller: _fullNameController,
                hintText: 'John Doe',
                enabled: !isLoading,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your full name'
                    : null,
              ),
              const SizedBox(height: Dimens.p16),

              _FieldLabel(text: 'Company Name'),
              AppTextField(
                controller: _companyNameController,
                hintText: 'Company Inc.',
                enabled: !isLoading,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your company name'
                    : null,
              ),
              const SizedBox(height: Dimens.p16),

              _FieldLabel(text: localizations.email),
              AppTextField(
                controller: _emailController,
                hintText: 'email@email.com',
                keyboardType: TextInputType.emailAddress,
                enabled: !isLoading,
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
                enabled: !isLoading,
                validator: (value) => (value != null && value.length >= 8)
                    ? null
                    : localizations.errorMinLength,
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
                enabled: !isLoading,
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
                onChanged: isLoading
                    ? null
                    : (v) => setState(() => _isTermsAccepted = v ?? false),
              ),
              const SizedBox(height: Dimens.p32),

              AppButton(
                text: localizations.signUp,
                onPressed: (_isTermsAccepted && !isLoading)
                    ? _handleSignup
                    : null,
                isLoading: isLoading,
                isExpanded: true,
              ),
            ],
          ),
        );
      },
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
  final ValueChanged<bool?>? onChanged;
  const _TermsCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
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
