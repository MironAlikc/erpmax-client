import '../../domain/entities/report_entities.dart';

class SubscriberModel extends SubscriberEntity {
  const SubscriberModel({
    required super.company,
    required super.plan,
    required super.status,
    required super.startDate,
    required super.endDate,
    required super.price,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) {
    return SubscriberModel(
      company: json['company_name'] ?? '',
      plan: json['subscription_plan'] ?? '',
      status: json['status'] ?? '',
      startDate: json['start_at'] ?? '',
      endDate: json['end_at'] ?? '',
      price: "SAR ${json['amount'] ?? '0'}",
    );
  }

  Map<String, dynamic> toJson() => {
    'company_name': company,
    'subscription_plan': plan,
    'status': status,
    'start_at': startDate,
    'end_at': endDate,
    'amount': price.replaceAll('SAR ', ''),
  };
}

class UsageModuleModel extends UsageModuleEntity {
  const UsageModuleModel({
    required super.moduleName,
    required super.activeSubscriptions,
    required super.usersCount,
    required super.storageLimit,
  });

  factory UsageModuleModel.fromJson(Map<String, dynamic> json) {
    return UsageModuleModel(
      moduleName: json['module_name'] ?? '',
      activeSubscriptions: json['active_subs_count'] ?? 0,
      usersCount: json['total_users'] ?? 0,
      storageLimit: json['limit_storage'] ?? '0 GB',
    );
  }
}

class PerformanceModel extends PerformanceEntity {
  const PerformanceModel({
    required super.date,
    required super.uptime,
    required super.responseTime,
    required super.errorRate,
  });

  factory PerformanceModel.fromJson(Map<String, dynamic> json) {
    return PerformanceModel(
      date: json['report_date'] ?? '',
      uptime: json['uptime_percent'] ?? '0%',
      responseTime: json['avg_response_ms'] ?? '0ms',
      errorRate: json['error_percent'] ?? '0%',
    );
  }
}
