import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SubscriptionsBarChart extends StatelessWidget {
  const SubscriptionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 300,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
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
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    months[value.toInt()],
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (v) =>
              FlLine(color: const Color(0xFFF1F5F9)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          _group(0, 110),
          _group(1, 140),
          _group(2, 170),
          _group(3, 210),
          _group(4, 250),
          _group(5, 290),
          _group(6, 330),
        ],
      ),
    );
  }

  BarChartGroupData _group(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF10192D), // Темный глубокий цвет из дизайна
          width: 32, // Ширина колонок как на фото
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          // Добавляем фоновую подложку для колонок (как на макете)
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 300,
            color: const Color(0xFFF8FAFC),
          ),
        ),
      ],
    );
  }
}
