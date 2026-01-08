// import 'package:erpmax_client/core/theme/app_theme.dart';
// import 'package:erpmax_client/core/theme/text_style_source.dart';
// import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
// import 'package:erpmax_client/features/saas_control/data/models/report_models.dart';
// import 'package:flutter/material.dart';

// class ReportStatCard extends StatelessWidget {
//   final ReportStat stat;
//   final double width;

//   const ReportStatCard({super.key, required this.stat, required this.width});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;
//     final Color trendColor = stat.isUp ? theme.success : theme.error;
//     final Color trendBg = trendColor.withValues(alpha: 0.05);

//     return SizedBox(
//       width: width,
//       child: AppCard(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: theme.gray50,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Icon(stat.icon, color: theme.gray900, size: 24),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: trendBg,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         stat.isUp ? Icons.north_east : Icons.south_east,
//                         size: 14,
//                         color: trendColor,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         stat.trend,
//                         style: AppTextStyles.bodySmallBold.copyWith(
//                           color: trendColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Text(
//               stat.title,
//               style: AppTextStyles.bodyMedium.copyWith(color: theme.gray500),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               stat.value,
//               style: AppTextStyles.h1.copyWith(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w700,
//                 color: theme.gray900,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
