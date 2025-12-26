import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/new_password_form.dart';
import 'package:flutter/material.dart';

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
