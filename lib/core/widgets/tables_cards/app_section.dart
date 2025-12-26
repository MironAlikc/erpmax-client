import 'package:erpmax_client/core/models/stat_card_data.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  final String title;
  final Widget child;

  const AppSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDesign.elementGap),
          child: Text(
            title,
            style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        AppCard(padding: EdgeInsets.zero, child: child),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final StatCardData stat;
  final double width;

  const StatCard({super.key, required this.stat, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final trendColor = stat.isUp ? theme.success : theme.error;

    return SizedBox(
      width: width,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(stat.icon, color: theme.primary, size: 28),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: trendColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDesign.chipRadius),
                  ),
                  child: Text(
                    stat.trend,
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: trendColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              stat.title,
              style: AppTextStyles.bodySmall.copyWith(
                color: theme.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(stat.value, style: AppTextStyles.h1.copyWith(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
