import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/reset_password/check_email_content.dart';
import 'package:flutter/material.dart';

class ResetPasswordCheckEmailPage extends StatelessWidget {
  const ResetPasswordCheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: CheckEmailContent(email: 'bob@reui.io', onResend: null),
    );
  }
}
