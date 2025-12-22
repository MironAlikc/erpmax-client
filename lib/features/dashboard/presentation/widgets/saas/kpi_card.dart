import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final bool isPositive;
  final IconData icon;

  const KpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.isPositive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final trendColor = isPositive ? AppColors.success : AppColors.error;
    final trendBg = trendColor.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: AppColors.gray600),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: trendBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  percentage,
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: trendColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.labelStyle),
              const SizedBox(height: 8),
              Text(value, style: AppTextStyles.h2),
            ],
          ),
        ],
      ),
    );
  }
}
