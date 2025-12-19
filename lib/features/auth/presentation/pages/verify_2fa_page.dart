// lib/features/auth/presentation/pages/verify_2fa_page.dart
import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';
import '../widgets/2fa/verify_2fa_form.dart';

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
