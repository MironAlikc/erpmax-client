import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class SystemHealthCard extends StatelessWidget {
  const SystemHealthCard({super.key});

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
            "System Health",
            style: AppTextStyles.bodySmallBold.copyWith(fontSize: 16, color: theme.gray900),
          ),
          const SizedBox(height: 20),
          _buildHealthRow("Servers", "Operational", true, theme),
          _buildHealthRow("Database", "Operational", true, theme),
          _buildHealthRow("API", "Operational", true, theme),
          _buildHealthRow("Backup", "Needs Review", false, theme),
        ],
      ),
    );
  }

  Widget _buildHealthRow(String title, String status, bool isGood, dynamic theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodySmall.copyWith(color: theme.gray500)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: isGood ? const Color(0xFFECFDF3) : const Color(0xFFFFFAEB),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: AppTextStyles.bodySmallBold.copyWith(
                fontSize: 11,
                color: isGood ? const Color(0xFF027A48) : const Color(0xFFB54708),
              ),
            ),
          ),
        ],
      ),
    );
  }
}