import 'package:erpmax_client/features/accounting/domain/entities/stat_entity.dart';
import 'package:flutter/material.dart';

class StatModel extends StatEntity {
  final IconData icon;
  final Color color;

  const StatModel({
    required super.title,
    required super.value,
    required super.trend,
    required super.isPositive,
    required this.icon,
    required this.color,
  });

  factory StatModel.fromEntity(
    StatEntity entity, {
    required IconData icon,
    required Color color,
  }) {
    return StatModel(
      title: entity.title,
      value: entity.value,
      trend: entity.trend,
      isPositive: entity.isPositive,
      icon: icon,
      color: color,
    );
  }

  StatEntity toEntity() {
    return StatEntity(
      title: title,
      value: value,
      trend: trend,
      isPositive: isPositive,
    );
  }
}
