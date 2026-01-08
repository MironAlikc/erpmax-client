import 'package:erpmax_client/features/saas_control/domain/entities/subscriber_entity.dart';

class SaasSubscriberRecord extends SubscriberEntity {
  final String id;
  final String date;

  const SaasSubscriberRecord({
    required this.id,
    required super.company,
    required super.plan,
    required super.status,
    required super.startDate,
    required super.endDate,
    required super.price,
    required this.date,
  });

  factory SaasSubscriberRecord.fromJson(Map<String, dynamic> json) {
    return SaasSubscriberRecord(
      id: json['id'] ?? '',
      company: json['company_name'] ?? json['company'] ?? '',
      plan: json['plan'] ?? '',
      status: json['status'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      price: json['price']?.toString() ?? '0',
      date: json['created_at'] ?? json['date'] ?? '',
    );
  }
}
