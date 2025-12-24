import 'package:erpmax_client/core/theme/app_design.dart';
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
    final isDesktop = size.width >= AppDesign.desktopBreakpoint;

    return Scaffold(
      backgroundColor: theme.gray50,
      resizeToAvoidBottomInset: true,
      body: Row(
        children: [
          if (isDesktop)
            Expanded(flex: AppDesign.authBannerFlex, child: sideBanner),
          Expanded(
            flex: isDesktop ? AppDesign.authFormFlex : 1,
            child: Container(
              color: theme.white,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: AppDesign.pagePadding,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppDesign.maxFormWidth,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppDesign.formInnerPadding),
                      decoration: BoxDecoration(
                        color: theme.white,
                        borderRadius: BorderRadius.circular(
                          AppDesign.cardRadius,
                        ),
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
