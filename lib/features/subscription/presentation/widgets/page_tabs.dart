import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class PageTabs extends StatefulWidget {
  const PageTabs({super.key});

  @override
  State<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends State<PageTabs> {
  int activeIndex = 1;

  List<String> getTabs(AppLocalizations l10n) => [
    l10n.menuDashboard,
    l10n.subscriptionManagement,
    l10n.packagePricing,
    l10n.moduleManagement,
    l10n.recentBackups,
    l10n.reports,
    l10n.profiles,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final currentTabs = getTabs(localizations);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(bottom: BorderSide(color: theme.borderLight)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: currentTabs.asMap().entries.map((entry) {
            final isActive = entry.key == activeIndex;
            return GestureDetector(
              onTap: () => setState(() => activeIndex = entry.key),
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive ? theme.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  entry.value,
                  style:
                      (isActive
                              ? AppTextStyles.sidebarItemActive
                              : AppTextStyles.sidebarItem)
                          .copyWith(
                            color: isActive
                                ? theme.primary
                                : theme.textSecondary,
                          ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
