import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class JournalEntriesSummaryMetricsBar extends StatelessWidget {
  const JournalEntriesSummaryMetricsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.white,
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMetricItem(
                        context,
                        icon: LucideIcons.fileText,
                        label: 'Entries:',
                        value: '10',
                        valueColor: theme.primary,
                      ),
                      _buildVerticalDivider(theme),
                      _buildMetricItem(
                        context,
                        icon: LucideIcons.trendingUp,
                        label: 'Total Debit:',
                        value: '104 270',
                        valueColor: theme.successText,
                      ),
                      _buildVerticalDivider(theme),
                      _buildMetricItem(
                        context,
                        icon: LucideIcons.trendingDown,
                        label: 'Total Credit:',
                        value: '104 270',
                        valueColor: theme.errorText,
                      ),
                      _buildVerticalDivider(theme),
                      _buildMetricItem(
                        context,
                        icon: LucideIcons.dollarSign,
                        label: 'Posted:',
                        value: '7',
                        valueColor: theme.successText,
                      ),
                      _buildVerticalDivider(theme),
                      _buildMetricItem(
                        context,
                        label: 'Drafts:',
                        value: '2',
                        valueColor: theme.warningText,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'SAR',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.download,
                        size: 18,
                        color: theme.textPrimary,
                      ),
                      label: Text(
                        'Export',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context, {
    IconData? icon,
    required String label,
    required String value,
    required Color valueColor,
  }) {
    final theme = context.theme.appColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: valueColor),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(color: theme.textSecondary),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: AppTextStyles.h3.copyWith(
            color: valueColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider(dynamic theme) {
    return Container(
      height: 24,
      width: 1,
      color: theme.border,
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
