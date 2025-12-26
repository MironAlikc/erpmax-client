// import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
// import 'package:erpmax_client/core/theme/app_design.dart';
// import 'package:erpmax_client/core/theme/app_theme.dart';
// import 'package:erpmax_client/core/theme/text_style_source.dart';
// import 'package:erpmax_client/features/accounting/presentation/widgets/stat_card.dart';
// import 'package:erpmax_client/features/dashboard/presentation/data/mocks/dashboard_mocks.dart';
// import 'package:erpmax_client/features/saas_control/presentation/pages/dashboard_content.dart';
// import 'package:flutter/material.dart';

// class DashboardContent extends StatelessWidget {
//   final double screenWidth;

//   const DashboardContent({super.key, required this.screenWidth});

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);
//     final bool isMobile = screenWidth < AppDesign.mobileBreakpoint;
//     final bool isTablet =
//         screenWidth < AppDesign.desktopBreakpoint && !isMobile;
//     final bool stackCharts = screenWidth < 1100;

//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppDesign.pagePadding,
//         vertical: 24,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionHeader(context, localizations.overview),
//           const SizedBox(height: 20),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: DashboardMocks.getSummaryData(context).length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//               childAspectRatio: isMobile ? 2.2 : (isTablet ? 1.8 : 1.6),
//             ),
//             itemBuilder: (context, index) {
//               final data = DashboardMocks.getSummaryData(context)[index];
//               return StatCard(
//                 title: data.title,
//                 value: "${data.currency}${data.value.toStringAsFixed(0)}",
//                 trend:
//                     "${data.changePercentage > 0 ? '+' : ''}${data.changePercentage}%",
//                 isPositive: data.changePercentage > 0,
//                 icon: data.icon,
//                 color: _getCardColor(context, index),
//               );
//             },
//           ),

//           const SizedBox(height: 32),
//           _buildSectionHeader(context, localizations.analytics),
//           const SizedBox(height: 20),
//           Flex(
//             direction: stackCharts ? Axis.vertical : Axis.horizontal,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: stackCharts ? 0 : 1,
//                 child: _ChartWrapper(
//                   title: localizations.revenueForecast,
//                   subtitle: localizations.monthlyRevenueProjection,
//                   chart: const RevenueLineChart(),
//                 ),
//               ),
//               _buildSpacing(stackCharts),
//               Expanded(
//                 flex: stackCharts ? 0 : 1,
//                 child: _ChartWrapper(
//                   title: localizations.activeSubscriptions,
//                   subtitle: localizations.growthByPackageType,
//                   chart: const SubscriptionsBarChart(),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 40),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(BuildContext context, String title) {
//     return Text(
//       title,
//       style: AppTextStyles.h2.copyWith(
//         color: context.theme.appColor.textPrimary,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   Widget _buildSpacing(bool isVertical) {
//     return isVertical ? const SizedBox(height: 24) : const SizedBox(width: 24);
//   }

//   Color _getCardColor(BuildContext context, int index) {
//     final theme = context.theme.appColor;

//     final List<Color> colors = [
//       theme.primary,
//       theme.success,
//       const Color(0xFFF59E0B),
//       const Color(0xFF8B5CF6),
//     ];
//     return colors[index % colors.length];
//   }
// }

// class _ChartWrapper extends StatelessWidget {
//   final String title;
//   final String? subtitle;
//   final Widget chart;

//   const _ChartWrapper({
//     required this.title,
//     this.subtitle,
//     required this.chart,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: theme.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: theme.gray100),
//         boxShadow: [
//           BoxShadow(
//             color: theme.shadowColor,
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title, style: AppTextStyles.h3),
//                     if (subtitle != null) ...[
//                       const SizedBox(height: 4),
//                       Text(
//                         subtitle!,
//                         style: AppTextStyles.bodySmall.copyWith(
//                           color: theme.gray500,
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//               Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {},
//                   borderRadius: BorderRadius.circular(8),
//                   child: Padding(
//                     padding: EdgeInsets.all(4.0),
//                     child: Icon(Icons.more_horiz, color: theme.gray400),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 32),
//           SizedBox(height: 320, child: chart),
//         ],
//       ),
//     );
//   }
// }
