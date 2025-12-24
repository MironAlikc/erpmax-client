import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AppStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final bool? isPositive;
  final IconData icon;

  const AppStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.trend,
    this.isPositive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final Color trendColor = isPositive == null
        ? theme.textSecondary
        : (isPositive! ? theme.success : theme.warning);

    final Color trendBg = trendColor.withValues(alpha: 0.1);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: theme.textDisabled.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: theme.textPrimary.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconBox(context),
              if (trend != "0%")
                _buildTrendBadge(trendColor, trendBg)
              else
                Text(
                  trend,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: theme.textDisabled,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyles.h1.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.textPrimary,
                letterSpacing: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconBox(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.textDisabled.withValues(alpha: 0.05)),
      ),
      child: Icon(icon, color: theme.primaryDark, size: 22),
    );
  }

  Widget _buildTrendBadge(Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPositive != null)
            Icon(
              isPositive! ? Icons.north_east : Icons.south_east,
              size: 12,
              color: color,
            ),
          const SizedBox(width: 4),
          Text(
            trend,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
