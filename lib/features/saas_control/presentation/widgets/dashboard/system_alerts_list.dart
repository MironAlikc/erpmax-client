import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class SystemAlertsList extends StatelessWidget {
  const SystemAlertsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final alerts = [
      {"text": "High memory usage on main server", "time": "5m"},
      {"text": "System update available", "time": "1h"},
      {"text": "Backup failed", "time": "2h"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "System Alerts",
              style: AppTextStyles.h4.copyWith(color: theme.gray800),
            ),
            const SizedBox(width: 8),
            Icon(Icons.warning_amber_rounded, color: theme.warning, size: 20),
          ],
        ),
        const SizedBox(height: 16),
        ...alerts.map(
          (alert) => _buildAlertItem(alert["text"]!, alert["time"]!, theme),
        ),
      ],
    );
  }

  Widget _buildAlertItem(String text, String time, dynamic theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.warningLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.warning.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: theme.warningText,
              ),
            ),
          ),
          Text(
            time,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: theme.warningText.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
