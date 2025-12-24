// import 'package:erpmax_client/core/theme/app_design.dart';
// import 'package:erpmax_client/core/theme/app_theme.dart';
// import 'package:erpmax_client/core/theme/text_style_source.dart';
// import 'package:erpmax_client/core/widgets/common/app_button.dart';
// import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/revenue_line_chart.dart';
// import 'package:erpmax_client/features/dashboard/presentation/widgets/saas/saas_metric_grid.dart';
// import 'package:erpmax_client/features/saas_admin/presentation/pages/dashboard_content.dart';
// import 'package:flutter/material.dart';

// class SaaSContent extends StatelessWidget {
//   const SaaSContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return ListView(
//       padding: EdgeInsets.all(AppDesign.pagePadding),
//       children: [
//         _buildHeader(context),
//         const SizedBox(height: 32),
//         const SaasMetricGrid(),
//         const SizedBox(height: 32),
//         Text('Performance Trends', style: AppTextStyles.h3),
//         const SizedBox(height: 16),
//         Container(
//           height: 400,
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: theme.white,
//             borderRadius: BorderRadius.circular(AppDesign.cardRadius),
//             border: Border.all(color: theme.gray200),
//           ),
//           child:  RevenueLineChart(),
//         ),
//       ],
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     final theme = context.theme.appColor;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('SaaS Analytics', style: AppTextStyles.h1),
//             const SizedBox(height: 4),
//             Text(
//               'Overview of your platform performance',
//               style: AppTextStyles.bodyMedium.copyWith(color: theme.gray500),
//             ),
//           ],
//         ),
//         AppButton(
//           text: 'Export Report',
//           icon: Icons.download_rounded,
//           type: AppButtonType.outline,
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
