import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/check_email_content.dart';
import 'package:flutter/material.dart';

class ResetPasswordCheckEmailPage extends StatelessWidget {
  final String email;
  final VoidCallback? onResend;

  const ResetPasswordCheckEmailPage({
    super.key,
    required this.email,
    this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return AuthBaseLayout(
      sideBanner: const LoginBanner(),
      child: CheckEmailContent(email: email, onResend: onResend),
    );
  }
}
