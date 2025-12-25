import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
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
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: theme.colorScheme.onPrimary),
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
                      ? localizations.dashboardSubtitle
                      : localizations.manageTitle(title),
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
