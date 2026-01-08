import 'package:erpmax_client/core/di/injection.dart';
import 'package:erpmax_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/auth_base_layout.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/login/login_banner.dart';
import 'package:erpmax_client/features/auth/presentation/widgets/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: const AuthBaseLayout(
        sideBanner: LoginBanner(),
        child: SignupForm(),
      ),
    );
  }
}
