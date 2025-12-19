// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';
import '../widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(sideBanner: LoginBanner(), child: LoginForm());
  }
}
