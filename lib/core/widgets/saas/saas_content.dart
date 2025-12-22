// lib/features/dashboard/presentation/widgets/saas/saas_content.dart

import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/revenue_line_chart.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/saas/saas_metric_grid.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';

class SaaSContent extends StatelessWidget {
  const SaaSContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppDesign.pagePadding),
      children: [
        _buildHeader(context),
        const SizedBox(height: 32),
        const SaasMetricGrid(),
        const SizedBox(height: 32),
        Text('Performance Trends', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        Container(
          height: 400,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDesign.cardRadius),
            border: Border.all(color: AppColors.gray200),
          ),
          child: const RevenueLineChart(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SaaS Analytics', style: AppTextStyles.h1),
            const SizedBox(height: 4),
            Text(
              'Overview of your platform performance',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray500,
              ),
            ),
          ],
        ),
        AppButton(
          text: 'Export Report',
          icon: Icons.download_rounded,
          type: AppButtonType.outline,
          onPressed: () {},
        ),
      ],
    );
  }
}
