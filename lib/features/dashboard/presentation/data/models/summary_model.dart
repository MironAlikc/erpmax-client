import 'package:flutter/material.dart';

class SummaryModel {
  final IconData icon;
  final String title;
  final double value;
  final double changePercentage;
  final Color iconColor;
  final Color iconBgColor;
  final String currency;

  const SummaryModel({
    required this.icon,
    required this.title,
    required this.value,
    required this.changePercentage,
    required this.iconColor,
    required this.iconBgColor,
    this.currency = '\$',
  });
}
