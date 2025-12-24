import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _onResetPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Имитация вызова API
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        context.go(RouteNames.passwordSuccess);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reset Password',
            style: AppTextStyles.h1.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Enter your new password to regain access.',
            style: AppTextStyles.bodySmall.copyWith(
              color: context.theme.appColor.gray500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDesign.sectionGap),

          const _FieldLabel(text: 'New Password'),
          AppTextField(
            hintText: 'Minimum 8 characters',
            controller: _passwordController,
            isPassword: true,
            obscureText: !_isPasswordVisible,
            enabled: !_isLoading,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            validator: (val) =>
                (val != null && val.length >= 8) ? null : 'Password too short',
          ),
          const SizedBox(height: AppDesign.elementGap),

          const _FieldLabel(text: 'Confirm Password'),
          AppTextField(
            hintText: 'Repeat your password',
            controller: _confirmController,
            isPassword: true,
            obscureText: true,
            enabled: !_isLoading,
            validator: (val) => val == _passwordController.text
                ? null
                : 'Passwords do not match',
          ),

          const SizedBox(height: AppDesign.sectionGap),

          AppButton(
            onPressed: _isLoading ? null : _onResetPressed,
            text: 'Submit',
            isLoading: _isLoading,
            isExpanded: true,
          ),
        ],
      ),
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
          fontSize: 14,
          color: context.theme.appColor.gray900,
        ),
      ),
    );
  }
}
