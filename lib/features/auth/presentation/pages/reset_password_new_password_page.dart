import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';
import '../widgets/reset_password/new_password_form.dart';

class ResetPasswordNewPasswordPage extends StatelessWidget {
  const ResetPasswordNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: NewPasswordForm(),
    );
  }
}
