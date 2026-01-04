import 'package:erpmax_client/core/theme/app_dimens.dart';
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
    final isDesktop = size.width >= AppDimens.desktopBreakpoint;

    return Scaffold(
      backgroundColor: theme.gray50,
      resizeToAvoidBottomInset: true,
      body: Row(
        children: [
          if (isDesktop)
            Expanded(flex: AppDimens.authBannerFlex, child: sideBanner),
          Expanded(
            flex: isDesktop ? AppDimens.authFormFlex : 1,
            child: Container(
              color: theme.white,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: AppDimens.pagePadding,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppDimens.maxFormWidth,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.formInnerPadding),
                      decoration: BoxDecoration(
                        color: theme.white,
                        borderRadius: BorderRadius.circular(
                          AppDimens.cardRadius,
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
