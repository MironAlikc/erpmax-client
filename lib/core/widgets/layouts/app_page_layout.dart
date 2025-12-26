import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_design.dart';

class AppPageLayout extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget child;
  final Widget? footer;
  final bool isScrollable;

  const AppPageLayout({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.actions,
    this.footer,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Scaffold(
      backgroundColor: theme.gray50,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDesign.pagePadding,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: theme.white,
                border: Border(
                  bottom: BorderSide(
                    color: theme.textDisabled.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.h1.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF12203A),
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: theme.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (actions != null) ...[
                    const SizedBox(width: 16),
                    Row(children: actions!),
                  ],
                ],
              ),
            ),

            Expanded(
              child: isScrollable
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(AppDesign.pagePadding),
                      child: child,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(AppDesign.pagePadding),
                      child: child,
                    ),
            ),
            if (footer != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.white,
                  border: Border(
                    top: BorderSide(
                      color: theme.textDisabled.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                child: footer!,
              ),
          ],
        ),
      ),
    );
  }
}
