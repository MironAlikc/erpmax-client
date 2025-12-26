import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/subscriber_badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionStatusView extends StatelessWidget {
  const SubscriptionStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.borderLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.successLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      CupertinoIcons.cube_box,
                      color: theme.success,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    localizations.subscriptionStatus,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                localizations.currentPlan,
                style: AppTextStyles.tableHeader.copyWith(
                  color: theme.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlanBadge(text: localizations.planStarter),
                  const SizedBox(width: 12),
                  Text(
                    "500",
                    style: AppTextStyles.base.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: theme.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "SAR",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(
                    localizations.perMonth,
                    style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
                  ),
                  const Spacer(),
                  const ActiveBadge(),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  _smallInfoBox(
                    context,
                    CupertinoIcons.calendar,
                    localizations.renewalDate,
                    localizations.daysOverdue(3),
                    valueColor: theme.success,
                  ),
                  const SizedBox(width: 16),
                  _smallInfoBox(
                    context,
                    CupertinoIcons.money_dollar,
                    localizations.mrr,
                    localizations.amountSAR(5.000),
                  ),
                  const SizedBox(width: 16),
                  _smallInfoBox(
                    context,
                    CupertinoIcons.calendar_badge_minus,
                    localizations.billingCycle,
                    localizations.monthly,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ProgressBarSection(
                label: localizations.columnUsers,
                current: 5,
                total: 100,
              ),
              const SizedBox(height: 24),
              ProgressBarSection(
                label: localizations.columnStorage,
                current: 100,
                total: 100,
                unit: "GB",
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _upgradeActionBox(
                context,
                icon: CupertinoIcons.arrow_up_circle,
                title: localizations.upgradePlan,
                subtitle: localizations.getMoreFeatures,
                color: theme.success,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _upgradeActionBox(
                context,
                icon: CupertinoIcons.arrow_down_circle,
                title: localizations.downgradePlan,
                subtitle: localizations.reduceCosts,
                color: theme.warning,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _smallInfoBox(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    final theme = context.theme.appColor;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: theme.gray50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: theme.textDisabled),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: AppTextStyles.tableHeader.copyWith(
                    color: theme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: AppTextStyles.base.copyWith(
                fontWeight: FontWeight.w700,
                color: valueColor ?? theme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _upgradeActionBox(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.borderLight),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.bodyMediumBold),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTextStyles.tableHeader.copyWith(
              color: theme.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarSection extends StatelessWidget {
  final String label;
  final double current;
  final double total;
  final String unit;

  const ProgressBarSection({
    super.key,
    required this.label,
    required this.current,
    required this.total,
    this.unit = "",
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.bodySmallBold.copyWith(color: theme.gray700),
            ),
            Text(
              "${current.toInt()}${unit.isNotEmpty ? ' $unit' : ''}/$total${unit.isNotEmpty ? ' $unit' : ''}",
              style: AppTextStyles.bodySmallBold.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: 8,
            backgroundColor: theme.gray100,
            valueColor: AlwaysStoppedAnimation<Color>(theme.textPrimary),
          ),
        ),
      ],
    );
  }
}
