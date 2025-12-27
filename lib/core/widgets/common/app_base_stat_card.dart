import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppBaseStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;
  final Widget? trailing;

  const AppBaseStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatIconBox(icon: icon, color: iconColor),
              if (trailing != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: trailing!,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: theme.gray500,
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: theme.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatIconBox extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const StatIconBox({super.key, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.gray50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color ?? theme.textPrimary, size: 22),
    );
  }
}

class StatTrendBadge extends StatelessWidget {
  final String trend;
  final bool? isPositive;

  const StatTrendBadge({super.key, required this.trend, this.isPositive});

  @override
  Widget build(BuildContext context) {
    final Color contentColor = isPositive == null
        ? const Color(0xFF64748B)
        : (isPositive! ? const Color(0xFF10B981) : const Color(0xFFEF4444));

    final Color bgColor = isPositive == null
        ? const Color(0xFFF1F5F9)
        : (isPositive! ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPositive != null) ...[
            Icon(
              isPositive!
                  ? LucideIcons.arrowUpRight
                  : LucideIcons.arrowDownRight,
              size: 14,
              color: contentColor,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            trend,
            style: TextStyle(
              color: contentColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
