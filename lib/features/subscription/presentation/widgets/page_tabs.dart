import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PageTabs extends StatefulWidget {
  const PageTabs({super.key});

  @override
  State<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends State<PageTabs> {
  int activeIndex = 1;
  final tabs = [
    'Dashboard',
    'Subscription Management',
    'Package & Pricing',
    'Module Management',
    'Backups',
    'Reports',
    'Profiles',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

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
          children: tabs.asMap().entries.map((entry) {
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
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive ? theme.primary : theme.textSecondary,
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
