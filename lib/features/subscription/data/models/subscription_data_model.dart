import 'package:erpmax_client/features/subscription/domain/entities/subscription_data_entity.dart';

class SubscriptionDataModel extends SubscriptionDataEntity {
  const SubscriptionDataModel({
    required super.company,
    required super.package,
    required super.endDate,
    required super.tag,
    required super.amount,
    required super.paymentStatus,
  });

  factory SubscriptionDataModel.fromEntity(SubscriptionDataEntity entity) {
    return SubscriptionDataModel(
      company: entity.company,
      package: entity.package,
      endDate: entity.endDate,
      tag: entity.tag,
      amount: entity.amount,
      paymentStatus: entity.paymentStatus,
    );
  }

  SubscriptionDataEntity toEntity() {
    return SubscriptionDataEntity(
      company: company,
      package: package,
      endDate: endDate,
      tag: tag,
      amount: amount,
      paymentStatus: paymentStatus,
    );
  }

  factory SubscriptionDataModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionDataModel(
      company: json['company'] as String,
      package: json['package'] as String,
      endDate: json['endDate'] as String,
      tag: json['tag'] as String,
      amount: json['amount'] as String,
      paymentStatus: json['paymentStatus'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'package': package,
      'endDate': endDate,
      'tag': tag,
      'amount': amount,
      'paymentStatus': paymentStatus,
    };
  }
}
