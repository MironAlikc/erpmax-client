// lib/features/auth/presentation/pages/forgot_password_page.dart
import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';
import '../widgets/forgot_password/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: ForgotPasswordForm(),
    );
  }
}
