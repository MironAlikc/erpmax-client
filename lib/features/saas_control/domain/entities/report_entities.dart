import 'package:flutter/widgets.dart';

class StatEntity {
  final String title;
  final String value;
  final IconData icon;
  final String trend;
  final bool isPositive;
  const StatEntity({
    required this.title,
    required this.value,
    required this.icon,
    required this.trend,
    required this.isPositive,
  });
}

class SubscriberEntity {
  final String company;
  final String plan;
  final String status;
  final String startDate;
  final String endDate;
  final String price;
  const SubscriberEntity({
    required this.company,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}

class UsageModuleEntity {
  final String moduleName;
  final int activeSubscriptions;
  final int usersCount;
  final String storageLimit;
  const UsageModuleEntity({
    required this.moduleName,
    required this.activeSubscriptions,
    required this.usersCount,
    required this.storageLimit,
  });
}

class PerformanceEntity {
  final String date;
  final String uptime;
  final String responseTime;
  final String errorRate;
  const PerformanceEntity({
    required this.date,
    required this.uptime,
    required this.responseTime,
    required this.errorRate,
  });
}
