import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/check_email_content.dart';
import 'package:flutter/material.dart';

class CheckEmailPage extends StatelessWidget {
  final String email;

  const CheckEmailPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return AuthBaseLayout(
      sideBanner: const LoginBanner(),
      child: CheckEmailContent(email: email),
    );
  }
}
