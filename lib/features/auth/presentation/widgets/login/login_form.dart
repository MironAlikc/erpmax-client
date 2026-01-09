import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/router/app_router.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:erpmax_client/core/widgets/common/buttons/app_button.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_event.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/common/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.loginRequested(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const _FormHeader(),
              const SizedBox(height: Dimens.p32),

              const SocialAuthButtons(),
              const SizedBox(height: Dimens.p16),

              DividerWithText(text: localizations.or),
              const SizedBox(height: Dimens.p16),

              AppTextField(
                controller: _emailController,
                label: localizations.email,
                hintText: 'example@company.com',
                keyboardType: TextInputType.emailAddress,
                enabled: !isLoading,
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
              const SizedBox(height: Dimens.p16),

              _PasswordField(
                controller: _passwordController,
                isObscured: _obscure,
                onToggle: () => setState(() => _obscure = !_obscure),
                enabled: !isLoading,
              ),

              _RememberMeRow(
                value: _remember,
                onChanged: isLoading
                    ? null
                    : (val) => setState(() => _remember = val ?? false),
              ),

              const SizedBox(height: Dimens.p32),

              AppButton(
                text: localizations.signIn,
                isExpanded: true,
                isLoading: isLoading,
                onPressed: isLoading ? null : _handleSignIn,
              ),
            ],
          ),
        );
      },
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
          localizations.signIn,
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
              AppLocalizations.of(context).password,
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
                AppLocalizations.of(context).forgot,
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
