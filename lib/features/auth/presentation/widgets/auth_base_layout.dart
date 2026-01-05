import 'package:erpmax_client/core/constants/breakpoints.dart';
import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthBaseLayout extends StatelessWidget {
  final Widget child;
  final Widget sideBanner;

  const AuthBaseLayout({
    super.key,
    required this.child,
    required this.sideBanner,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final size = MediaQuery.sizeOf(context);
    final isDesktop = size.width >= Breakpoint.desktopBreakpoint;

    return Scaffold(
      backgroundColor: theme.gray50,
      resizeToAvoidBottomInset: true,
      body: Row(
        children: [
          if (isDesktop) Expanded(flex: 6, child: sideBanner),
          Expanded(
            flex: isDesktop ? 5 : 1,
            child: Container(
              color: theme.white,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: Dimens.p24,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: Container(
                      padding: const EdgeInsets.all(Dimens.p40),
                      decoration: BoxDecoration(
                        color: theme.white,
                        borderRadius: BorderRadius.circular(Dimens.p12),
                        border: Border.all(
                          color: theme.textDisabled.withValues(alpha: 0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.textPrimary.withValues(alpha: 0.05),
                            blurRadius: 40,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
