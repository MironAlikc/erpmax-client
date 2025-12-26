import 'package:erpmax_client/features/auth/presentation/widgets/2fa/verify_2fa_form.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:flutter/material.dart';

class Verify2faPage extends StatelessWidget {
  const Verify2faPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(
      sideBanner: LoginBanner(),
      child: Verify2faForm(),
    );
  }
}
