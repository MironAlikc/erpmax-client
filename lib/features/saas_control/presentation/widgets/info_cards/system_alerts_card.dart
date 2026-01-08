import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardSystemAlerts extends StatelessWidget {
  const DashboardSystemAlerts({super.key});

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
                "System Alerts",
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.gray900,
                  fontSize: 14,
                ),
              ),
              Icon(LucideIcons.alertTriangle, color: theme.warning, size: 18),
            ],
          ),
          const SizedBox(height: 20),
          _buildAlertItem(
            theme,
            label: "High memory usage on main server",
            time: "5m",
            bgColor: const Color(0xFFFFFBEB),
          ),
          const SizedBox(height: 12),
          _buildAlertItem(
            theme,
            label: "System update available",
            time: "1h",
            bgColor: const Color(0xFFEFF6FF),
          ),
          const SizedBox(height: 12),
          _buildAlertItem(
            theme,
            label: "Backup failed",
            time: "2h",
            bgColor: const Color(0xFFFEF2F2),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(
    AppColorExtension theme, {
    required String label,
    required String time,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: theme.gray700),
          ),
          Text(
            time,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.gray400,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
