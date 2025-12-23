import '../../domain/entities/subscription_entity.dart';

class SubscriptionModel extends SubscriptionEntity {
  const SubscriptionModel({
    required super.subNumber,
    required super.client,
    required super.package,
    required super.startDate,
    required super.endDate,
    required super.tags,
    required super.amount,
    required super.paymentStatus,
  });

  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) {
    return SubscriptionModel(
      subNumber: entity.subNumber,
      client: entity.client,
      package: entity.package,
      startDate: entity.startDate,
      endDate: entity.endDate,
      tags: entity.tags,
      amount: entity.amount,
      paymentStatus: entity.paymentStatus,
    );
  }

  SubscriptionEntity toEntity() {
    return SubscriptionEntity(
      subNumber: subNumber,
      client: client,
      package: package,
      startDate: startDate,
      endDate: endDate,
      tags: tags,
      amount: amount,
      paymentStatus: paymentStatus,
    );
  }

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      subNumber: json['subNumber'] as String,
      client: json['client'] as String,
      package: json['package'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      tags: json['tags'] as String,
      amount: json['amount'] as String,
      paymentStatus: json['paymentStatus'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subNumber': subNumber,
      'client': client,
      'package': package,
      'startDate': startDate,
      'endDate': endDate,
      'tags': tags,
      'amount': amount,
      'paymentStatus': paymentStatus,
    };
  }
}
