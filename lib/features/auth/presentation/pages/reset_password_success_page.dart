import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';
import '../widgets/reset_password/password_success_content.dart'; // Выносим контент

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: PasswordSuccessContent(),
    );
  }
}
