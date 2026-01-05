import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PartiesStatRow extends StatelessWidget {
  final PartiesStats stats;

  const PartiesStatRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: _PartiesStatCard(
            title: localizations.totalCustomers,
            value: stats.totalCustomers.toString(),
            subtitle: '${stats.activeCustomers} Active',
            icon: LucideIcons.users,
            color: theme.infoText,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _PartiesStatCard(
            title: localizations.totalReceivables,
            value: stats.totalReceivables,
            subtitle: '${stats.overdueReceivables} Overdue',
            icon: LucideIcons.trendingUp,
            color: theme.successText,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _PartiesStatCard(
            title: localizations.totalSuppliers,
            value: stats.totalSuppliers.toString(),
            subtitle: '${stats.activeSuppliers} Active',
            icon: LucideIcons.truck,
            color: theme.warningText,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _PartiesStatCard(
            title: localizations.totalPayables,
            value: stats.totalPayables,
            subtitle: '${stats.overduePayables} Overdue',
            icon: LucideIcons.trendingDown,
            color: theme.errorText,
          ),
        ),
      ],
    );
  }
}

class _PartiesStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _PartiesStatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.p12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color.withValues(alpha: 0.02),
            color.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(Dimens.p12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodySmall.copyWith(color: color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH6,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: AppTextStyles.h2.copyWith(
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.caption.copyWith(
                    color: color.withValues(alpha: 0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Dimens.p8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Dimens.p12),
            ),
            child: Icon(
              icon,
              color: context.theme.appColor.textWhite,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
