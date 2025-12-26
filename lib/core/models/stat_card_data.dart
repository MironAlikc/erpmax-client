import 'package:flutter/material.dart';

class StatCardData {
  final String title, value, trend;
  final bool isUp;
  final IconData icon;
  const StatCardData({
    required this.title,
    required this.value,
    required this.trend,
    required this.isUp,
    required this.icon,
  });
}
