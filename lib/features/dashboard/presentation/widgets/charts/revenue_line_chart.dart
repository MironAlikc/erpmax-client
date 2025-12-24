import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueLineChart extends StatelessWidget {
  const RevenueLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: theme.gray200, strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '${(value / 1000).toInt()}k',
                style: TextStyle(color: theme.textSecondary, fontSize: 11),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                ];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      months[value.toInt()],
                      style: TextStyle(
                        color: theme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 40000),
              FlSpot(1, 30000),
              FlSpot(2, 45000),
              FlSpot(3, 50000),
              FlSpot(4, 58000),
              FlSpot(5, 52000),
              FlSpot(6, 75000),
            ],
            isCurved: true,
            color: theme.primary,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.primary.withValues(alpha: 0.2),
                  theme.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       LineChartData(
//         gridData: FlGridData(
//           show: true,
//           drawVerticalLine: false,
//           getDrawingHorizontalLine: (value) =>
//               FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1),
//         ),
//         titlesData: FlTitlesData(
//           rightTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           topTitles: const AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 40,
//               getTitlesWidget: (value, meta) => Text(
//                 '${(value / 1000).toInt()}k',
//                 style: const TextStyle(color: Colors.grey, fontSize: 11),
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
//                 if (value.toInt() >= 0 && value.toInt() < months.length) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Text(
//                       months[value.toInt()],
//                       style: const TextStyle(color: Colors.grey, fontSize: 11),
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ),
//         ),
//         borderData: FlBorderData(show: false),
//         lineBarsData: [
//           LineChartBarData(
//             spots: const [
//               FlSpot(0, 40000),
//               FlSpot(1, 30000),
//               FlSpot(2, 45000),
//               FlSpot(3, 50000),
//               FlSpot(4, 58000),
//               FlSpot(5, 52000),
//               FlSpot(6, 75000),
//             ],
//             isCurved: true,
//             color: AppColors.primary,
//             barWidth: 4,
//             isStrokeCapRound: true,
//             dotData: const FlDotData(show: false),
//             belowBarData: BarAreaData(
//               show: true,
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   AppColors.primary.withOpacity(0.2),
//                   AppColors.primary.withOpacity(0.0),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
