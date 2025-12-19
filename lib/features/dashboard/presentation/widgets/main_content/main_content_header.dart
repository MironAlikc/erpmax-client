// lib/features/dashboard/presentation/widgets/main_content/main_content_header.dart

import 'package:flutter/material.dart';

class MainContentHeader extends StatelessWidget {
  final String title;
  final bool isDashboard;

  const MainContentHeader({
    required this.title,
    this.isDashboard = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border(bottom: BorderSide(color: theme.dividerColor, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isDashboard
                      ? "Welcome back! Here's what's happening."
                      : 'Manage $title',
                  style: textTheme.bodySmall!.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
