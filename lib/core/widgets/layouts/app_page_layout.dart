import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AppPageLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget child;
  final Widget? footer;
  final bool isScrollable;

  const AppPageLayout({
    super.key,
    required this.title,
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
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.white,
                border: Border(
                  bottom: BorderSide(
                    color: theme.textDisabled.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.labelStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.textPrimary,
                      ),
                    ),
                  ),
                  if (actions != null) ...[
                    const SizedBox(width: 16),
                    Wrap(spacing: 12, children: actions!),
                  ],
                ],
              ),
            ),
            Expanded(
              child: isScrollable
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: child,
                    )
                  : Padding(padding: const EdgeInsets.all(24), child: child),
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
