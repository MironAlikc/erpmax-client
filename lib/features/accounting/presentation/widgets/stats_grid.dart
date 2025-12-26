import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = (constraints.maxWidth - (20 * 3)) / 4;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _StatItem(
              title: localizations.totalRevenue,
              value: "\$124,500",
              trend: "+12.5%",
              isUp: true,
              icon: Icons.trending_up,
              width: cardWidth,
            ),
            _StatItem(
              title: localizations.totalExpenses,
              value: "\$45,200",
              trend: "-2.4%",
              isUp: false,
              icon: Icons.trending_down,
              width: cardWidth,
            ),
            _StatItem(
              title: localizations.netProfit,
              value: "\$79,300",
              trend: "+8.2%",
              isUp: true,
              icon: Icons.attach_money,
              width: cardWidth,
            ),
            _StatItem(
              title: localizations.cashFlow,
              value: "\$32,000",
              trend: "+5.1%",
              isUp: true,
              icon: Icons.account_balance_wallet_outlined,
              width: cardWidth,
            ),
          ],
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title, value, trend;
  final bool isUp;
  final IconData icon;
  final double width;

  const _StatItem({
    required this.title,
    required this.value,
    required this.trend,
    required this.isUp,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      width: width.clamp(250, 500),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.borderLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 24, color: theme.textPrimary),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isUp
                      ? theme.success.withValues(alpha: 0.1)
                      : theme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  trend,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isUp ? theme.success : theme.error,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.h1.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: theme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
