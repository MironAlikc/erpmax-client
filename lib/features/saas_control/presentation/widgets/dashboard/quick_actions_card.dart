import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: AppTextStyles.bodySmallBold.copyWith(
              fontSize: 16,
              color: theme.gray900,
            ),
          ),
          const SizedBox(height: 20),
          _buildActionBtn("Add Subscriber", LucideIcons.userPlus, theme),
          _buildActionBtn("Manage Packages", LucideIcons.package, theme),
          _buildActionBtn("View Invoices", LucideIcons.fileText, theme),
          _buildActionBtn("View Reports", LucideIcons.barChart, theme),
        ],
      ),
    );
  }

  Widget _buildActionBtn(String title, IconData icon, dynamic theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: theme.gray100),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: theme.gray500),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
