import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/contra_indicators/contra_indications_data.dart';
import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final ContraIndicationsData data;

  const MetricCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: theme.shadowColor, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textSecondary,
                ),
              ),
              ...[Icon(data.icon, size: 16, color: data.iconColor)],
            ],
          ),
          const SizedBox(height: 12),
          Text(
            data.value,
            style: AppTextStyles.h1.copyWith(
              fontSize: 28,
              color: theme.textTertiary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.target,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 11,
              color: theme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),

          if (data.metric != null)
            Text(
              data.metric!,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 11,
                color: theme.sidebarActiveIcon,
              ),
            ),

          if (data.progress != null)
            LinearProgressIndicator(
              value: data.progress,
              backgroundColor: theme.gray200,
              color: theme.primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
            ),
        ],
      ),
    );
  }
}
