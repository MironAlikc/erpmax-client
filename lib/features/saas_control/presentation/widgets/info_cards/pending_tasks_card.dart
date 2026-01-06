import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardPendingTasks extends StatelessWidget {
  const DashboardPendingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pending Tasks",
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray900,
                  fontSize: 14,
                ),
              ),
              Icon(LucideIcons.clock, color: theme.gray400, size: 18),
            ],
          ),
          const SizedBox(height: 20),
          _buildTaskItem(theme, "Subscriptions pending renewal", 12),
          const SizedBox(height: 12),
          _buildTaskItem(theme, "Unpaid invoices", 8),
          const SizedBox(height: 12),
          _buildTaskItem(theme, "Open support tickets", 5),
        ],
      ),
    );
  }

  Widget _buildTaskItem(AppColorExtension theme, String title, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.gray50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.gray100.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(color: theme.gray700),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: theme.white,
              border: Border.all(color: theme.gray200),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              count.toString(),
              style: AppTextStyles.bodySmallBold.copyWith(
                color: theme.gray900,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
