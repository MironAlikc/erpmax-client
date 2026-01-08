import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/invoices_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BillingStatRow extends StatelessWidget {
  final InvoicesStats stats;

  const BillingStatRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: _InvoicesStatCard(
            title: localizations.totalInvoiced,
            value:
                '${formatNum(stats.totalInvoiced.amount)} ${stats.totalInvoiced.currency}',
            icon: LucideIcons.receipt,
            color: theme.accentBlue,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _InvoicesStatCard(
            title: localizations.statusPaid,
            value:
                '${formatNum(stats.paid.amount)} ${stats.totalInvoiced.currency}',
            icon: LucideIcons.checkCircle,
            color: theme.activeGreen,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _InvoicesStatCard(
            title: localizations.statusPending,
            value:
                '${formatNum(stats.paid.amount)} ${stats.totalInvoiced.currency}',
            icon: LucideIcons.clock,
            color: theme.warning,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: _InvoicesStatCard(
            title: localizations.statusOverdue,
            value:
                '${formatNum(stats.overdue.amount)} ${stats.totalInvoiced.currency}',
            icon: LucideIcons.alertTriangle,
            color: theme.error,
          ),
        ),
      ],
    );
  }
}

class _InvoicesStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InvoicesStatCard({
    required this.title,
    required this.value,
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
          Container(
            padding: const EdgeInsets.all(Dimens.p8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Dimens.p12),
            ),
            child: Icon(
              icon,
              color: context.theme.appColor.textWhite,
              size: 22,
            ),
          ),
          gapW16,
          Flexible(
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
                gapH4,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
