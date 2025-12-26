import 'package:erpmax_client/features/saas_control/data/models/report_models.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';

class ReportStatCard extends StatelessWidget {
  final ReportStat stat;
  final double width;

  const ReportStatCard({super.key, required this.stat, required this.width});

  @override
  Widget build(BuildContext context) {
    final Color trendColor = stat.isUp
        ? const Color(0xFF12B76A)
        : const Color(0xFFF04438);
    final Color trendBg = trendColor.withOpacity(0.05);

    return SizedBox(
      width: width,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    stat.icon,
                    color: const Color(0xFF101828),
                    size: 24,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: trendBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        stat.isUp ? Icons.north_east : Icons.south_east,
                        size: 14,
                        color: trendColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        stat.trend,
                        style: AppTextStyles.bodySmallBold.copyWith(
                          color: trendColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              stat.title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: const Color(0xFF667085),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              stat.value,
              style: AppTextStyles.h1.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF101828),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
