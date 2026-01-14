import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_base_stat_card.dart';
import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';
import 'package:flutter/material.dart';

class SubscriberStatsGrid extends StatelessWidget {
  const SubscriberStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = context.theme.appColor;

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisExtent: 110,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        AppBaseStatCard(
          title: l10n.statTotalTenants,
          value: "6",
          icon: Icons.business,
          iconColor: theme.indigoText,
        ),
        AppBaseStatCard(
          title: l10n.activeSubscriptions,
          value: "3",
          icon: Icons.check_circle_outline,
          iconColor: theme.success,
        ),
        AppBaseStatCard(
          title: l10n.statTrialAccounts,
          value: "1",
          icon: Icons.access_time,
          iconColor: theme.warning,
        ),
        AppBaseStatCard(
          title: l10n.statusSuspended,
          value: "1",
          icon: Icons.pause_circle_outline,
          iconColor: theme.error,
        ),
        AppBaseStatCard(
          title: l10n.statMRR,
          value: "11,500 SAR",
          icon: Icons.credit_card_outlined,
        ),
      ],
    );
  }
}

class TenantCell extends StatelessWidget {
  final SubscriberModel item;
  const TenantCell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Row(
      children: [
        StatIconBox(icon: Icons.business, color: theme.textTertiary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.company, style: AppTextStyles.bodyMediumBold),
              Text(
                item.email,
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textDisabled,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressCell extends StatelessWidget {
  final int current;
  final int max;
  final String unit;
  final IconData icon;

  const ProgressCell({
    super.key,
    required this.current,
    required this.max,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final double progress = (current / max).clamp(0.0, 1.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$current/$max $unit", style: AppTextStyles.bodySmallBold),
            Icon(icon, size: 14, color: theme.textDisabled),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: progress,
          minHeight: 6,
          borderRadius: BorderRadius.circular(4),
          backgroundColor: theme.inactiveBg,
          color: progress > 0.85 ? theme.warning : theme.success,
        ),
      ],
    );
  }
}
