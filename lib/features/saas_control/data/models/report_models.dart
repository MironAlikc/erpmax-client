import 'package:erpmax_client/features/saas_control/domain/entities/subscriber_entity.dart';
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

class UsageModuleModel extends UsageModuleEntity {
  const UsageModuleModel({
    required super.moduleName,
    required super.activeSubscriptions,
    required super.usersCount,
    required super.storageLimit,
  });

  factory UsageModuleModel.fromJson(Map<String, dynamic> json) =>
      UsageModuleModel(
        moduleName: json['module_name'] ?? '',
        activeSubscriptions: json['active_subs'] ?? 0,
        usersCount: json['users_count'] ?? 0,
        storageLimit: json['storage_limit'] ?? '',
      );
}

class PerformanceModel extends PerformanceEntity {
  const PerformanceModel({
    required super.date,
    required super.uptime,
    required super.responseTime,
    required super.errorRate,
  });

  factory PerformanceModel.fromJson(Map<String, dynamic> json) =>
      PerformanceModel(
        date: json['date'] ?? '',
        uptime: json['uptime'] ?? '',
        responseTime: json['response_time'] ?? '',
        errorRate: json['error_rate'] ?? '',
      );
}
