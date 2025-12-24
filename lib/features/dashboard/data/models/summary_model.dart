import 'package:flutter/material.dart';
import '../../domain/entities/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const SummaryModel({
    required this.icon,
    required super.title,
    required super.value,
    required super.changePercentage,
    required this.iconColor,
    required this.iconBgColor,
    super.currency,
  });

  factory SummaryModel.fromEntity(
    SummaryEntity entity, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return SummaryModel(
      icon: icon,
      title: entity.title,
      value: entity.value,
      changePercentage: entity.changePercentage,
      iconColor: iconColor,
      iconBgColor: iconBgColor,
      currency: entity.currency,
    );
  }

  SummaryEntity toEntity() {
    return SummaryEntity(
      title: title,
      value: value,
      changePercentage: changePercentage,
      currency: currency,
    );
  }
}
