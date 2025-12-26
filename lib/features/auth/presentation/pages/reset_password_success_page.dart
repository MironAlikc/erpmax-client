import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/password_success_content.dart';
import 'package:flutter/material.dart';

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
