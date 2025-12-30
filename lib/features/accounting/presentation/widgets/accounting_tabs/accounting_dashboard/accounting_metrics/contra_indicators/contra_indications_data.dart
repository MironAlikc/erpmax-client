import 'package:flutter/material.dart';

enum ContraIndicationsStatus { healthy, warning, success }

class ContraIndicationsData {
  final String title;
  final String value;
  final String target;
  final String? metric;
  final ContraIndicationsStatus status;
  final IconData icon;
  final Color iconColor;
  final double? progress;

  const ContraIndicationsData({
    required this.title,
    required this.value,
    required this.target,
    this.metric,
    required this.status,
    required this.icon,
    required this.iconColor,
    this.progress,
  });
}
