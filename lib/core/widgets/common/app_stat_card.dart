import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:erpmax_client/core/design/app_design.dart';

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
    final colors = AppColorExtension.of(context);
    final theme = Theme.of(context);
    final Color trendColor = isPositive == null
        ? colors.textSecondary
        : (isPositive! ? colors.success : colors.warning);

    final Color trendBg = trendColor.withValues(alpha: 0.1);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: colors.textDisabled.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: colors.textPrimary.withValues(alpha: 0.02),
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
              _buildIconBox(colors, theme),
              if (trend != "0%")
                _buildTrendBadge(trendColor, trendBg)
              else
                Text(
                  trend,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.textDisabled,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: colors.textPrimary,
                letterSpacing: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconBox(AppColorExtension colors, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.textDisabled.withValues(alpha: 0.05)),
      ),
      child: Icon(icon, color: colors.primaryDark, size: 22),
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
