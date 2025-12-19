// lib/features/dashboard/presentation/widgets/sidebar/sidebar_header.dart

import 'package:flutter/material.dart';

class SidebarHeader extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SidebarHeader({
    required this.isExpanded,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final double horizontalPadding = isExpanded ? 20 : 16;
    const double height = 60;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border(bottom: BorderSide(color: theme.dividerColor, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.apps,
            size: isExpanded ? 24 : 32,
            color: theme.colorScheme.primary,
          ),
          if (isExpanded) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'ERPMax Client',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textTheme.titleMedium!.color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          IconButton(
            icon: Icon(
              isExpanded
                  ? Icons.arrow_back_ios_new_outlined
                  : Icons.arrow_forward_ios_outlined,
              size: 16,
              color: textTheme.bodySmall!.color,
            ),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }
}
