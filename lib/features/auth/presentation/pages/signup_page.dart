// lib/features/auth/presentation/pages/signup_page.dart
import 'package:erpmax_client/features/auth/presentation/widgets/signup/signup_form.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_base_layout.dart';
import '../widgets/login/login_banner.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthBaseLayout(sideBanner: LoginBanner(), child: SignupForm());
  }
}
