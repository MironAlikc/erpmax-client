import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/forgot_password/forgot_password_form.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:flutter/material.dart';

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
