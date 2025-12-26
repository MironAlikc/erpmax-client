import 'package:flutter/material.dart';

class ReportStat {
  final String title;
  final String value;
  final String trend;
  final bool isUp;
  final IconData icon;

  const ReportStat({
    required this.title,
    required this.value,
    required this.trend,
    required this.isUp,
    required this.icon,
  });
}

class ReportSubscriber {
  final String company;
  final String plan;
  final String status;
  final String startDate;
  final String endDate;
  final String price;

  const ReportSubscriber({
    required this.company,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}
