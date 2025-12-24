// import 'package:erpmax_client/core/widgets/common/app_stat_card.dart';
// import 'package:erpmax_client/features/dashboard/presentation/widgets/charts/revenue_line_chart.dart';
// import 'package:erpmax_client/features/saas_admin/presentation/pages/dashboard_content.dart';
// import 'package:erpmax_client/features/saas_admin/presentation/widgets/saas/subscriptions_bar_chart.dart' hide SubscriptionsBarChart;
// import 'package:flutter/material.dart';

// class SaasSummaryView extends StatelessWidget {
//   final double screenWidth;
//   const SaasSummaryView({super.key, required this.screenWidth});

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmall = screenWidth < 1100;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         children: [
//           GridView.count(
//             crossAxisCount: screenWidth < 600
//                 ? 1
//                 : (screenWidth < 1200 ? 2 : 4),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 1.8,
//             children: const [
//               AppStatCard(
//                 title: "MRR",
//                 value: "SAR 125,000",
//                 trend: "+12.5%",
//                 isPositive: true,
//                 icon: Icons.attach_money,
//               ),
//               AppStatCard(
//                 title: "Churn Rate",
//                 value: "2.4%",
//                 trend: "-0.5%",
//                 isPositive: false,
//                 icon: Icons.trending_down,
//               ),
//               AppStatCard(
//                 title: "Retension",
//                 value: "98.2%",
//                 trend: "+1.1%",
//                 isPositive: true,
//                 icon: Icons.people_outline,
//               ),
//               AppStatCard(
//                 title: "Performance",
//                 value: "99.9%",
//                 trend: "0%",
//                 isPositive: null,
//                 icon: Icons.show_chart,
//               ),
//             ],
//           ),
//           const SizedBox(height: 32),
//           Flex(
//             direction: isSmall ? Axis.vertical : Axis.horizontal,
//             children: [
//               Expanded(
//                 flex: isSmall ? 0 : 1,
//                 child: _ChartBox(
//                   title: "Revenue",
//                   chart: const RevenueLineChart(),
//                 ),
//               ),
//               if (!isSmall) const SizedBox(width: 24),
//               if (isSmall) const SizedBox(height: 24),
//               Expanded(
//                 flex: isSmall ? 0 : 1,
//                 child: _ChartBox(
//                   title: "Subscriptions",
//                   chart: const SubscriptionsBarChart(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ChartBox extends StatelessWidget {
//   final String title;
//   final Widget chart;
//   const _ChartBox({required this.title, required this.chart});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: theme.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: theme.border),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 32),
//           SizedBox(height: 300, child: chart),
//         ],
//       ),
//     );
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFFE2E8F0)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 32),
//           SizedBox(height: 300, child: chart),
//         ],
//       ),
//     );
//   }
// }
