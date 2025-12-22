import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';

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
    final colors = AppColorExtension.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: colors.textDisabled.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary,
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
                  color: theme.colorScheme.surface,
                  border: Border(
                    top: BorderSide(
                      color: colors.textDisabled.withValues(alpha: 0.1),
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
