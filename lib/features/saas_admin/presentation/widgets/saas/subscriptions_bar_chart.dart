// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class SubscriptionsBarChart extends StatelessWidget {
//   const SubscriptionsBarChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return BarChart(
//       BarChartData(
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 350,
//         barTouchData: BarTouchData(
//           enabled: true,
//           touchTooltipData: BarTouchTooltipData(
//             getTooltipColor: (_) => theme.primary,
//           ),
//         ),
//         titlesData: FlTitlesData(
//           show: true,
//           topTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           rightTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 35,
//               getTitlesWidget: (value, meta) => Text(
//                 value.toInt().toString(),
//                 style: TextStyle(color: theme.textSecondary, fontSize: 11),
//               ),
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 const months = [
//                   'Jan',
//                   'Feb',
//                   'Mar',
//                   'Apr',
//                   'May',
//                   'Jun',
//                   'Jul',
//                 ];
//                 if (value.toInt() >= months.length) return const SizedBox();
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Text(
//                     months[value.toInt()],
//                     style: AppTextStyles.bodySmall.copyWith(
//                       color: theme.textDisabled,
//                       fontSize: 11,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         gridData: FlGridData(
//           show: true,
//           drawVerticalLine: false,
//           getDrawingHorizontalLine: (v) =>
//               FlLine(color: theme.inactiveBg, strokeWidth: 1),
//         ),
//         borderData: FlBorderData(show: false),
//         barGroups: [
//           _group(theme, 0, 110),
//           _group(theme, 1, 140),
//           _group(theme, 2, 170),
//           _group(theme, 3, 210),
//           _group(theme, 4, 250),
//           _group(theme, 5, 290),
//           _group(theme, 6, 330),
//         ],
//       ),
//     );
//   }

//   BarChartGroupData _group(AppColorExtension theme, int x, double y) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: theme.primary,
//           width: 32,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 350,
//             color: theme.inactiveBg,
//           ),
//         ),
//       ],
//     );
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 350,
//         barTouchData: BarTouchData(
//           enabled: true,
//           touchTooltipData: BarTouchTooltipData(
//             getTooltipColor: (_) => const Color(0xFF10192D),
//           ),
//         ),
//         titlesData: FlTitlesData(
//           show: true,
//           topTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           rightTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 35,
//               getTitlesWidget: (value, meta) => Text(
//                 value.toInt().toString(),
//                 style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
//               ),
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 const months = [
//                   'Jan',
//                   'Feb',
//                   'Mar',
//                   'Apr',
//                   'May',
//                   'Jun',
//                   'Jul',
//                 ];
//                 if (value.toInt() >= months.length) return const SizedBox();
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Text(
//                     months[value.toInt()],
//                     style: const TextStyle(
//                       color: Color(0xFF94A3B8),
//                       fontSize: 11,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         gridData: FlGridData(
//           show: true,
//           drawVerticalLine: false,
//           getDrawingHorizontalLine: (v) =>
//               FlLine(color: const Color(0xFFF1F5F9), strokeWidth: 1),
//         ),
//         borderData: FlBorderData(show: false),
//         barGroups: [
//           _group(0, 110),
//           _group(1, 140),
//           _group(2, 170),
//           _group(3, 210),
//           _group(4, 250),
//           _group(5, 290),
//           _group(6, 330),
//         ],
//       ),
//     );
//   }

//   BarChartGroupData _group(int x, double y) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: const Color(0xFF10192D),
//           width: 32,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 350,
//             color: const Color(0xFFF8FAFC),
//           ),
//         ),
//       ],
//     );
//   }
// }
