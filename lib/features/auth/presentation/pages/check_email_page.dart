import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/check_email_content.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: CheckEmailContent(email: 'user@example.com'),
    );
  }
}
